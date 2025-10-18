# whatsapp_bot.py
def send_images_to_whatsapp(chat_name, base_folder, chrome_profile):
    from selenium import webdriver
    from selenium.webdriver.common.by import By
    from selenium.webdriver.common.keys import Keys
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.webdriver.support import expected_conditions as EC
    from selenium.webdriver.chrome.options import Options
    import time
    import os
    import traceback
    import re

    # === CONFIGURATION ===
    CHAT_NAME = "Kannan"  # WhatsApp contact or group name
    BASE_FOLDER = r"C:\Users\jayak\OneDrive\Desktop\bot\photos"
    WAIT_TIME = 1  # in seconds
    CHROME_PROFILE = r"C:\whatsapp_profile"
    PROGRESS_FILE = "progress.txt"

    # === Chrome Setup ===
    options = Options()
    options.add_argument(f"--user-data-dir={CHROME_PROFILE}")
    options.add_argument("--profile-directory=Default")
    options.add_experimental_option("detach", True)

    driver = webdriver.Chrome(executable_path=r"C:\webdrivers\chromedriver.exe", options=options)
    driver.get("https://web.whatsapp.com")

    WebDriverWait(driver, 120).until(
        EC.presence_of_element_located((By.XPATH, '//div[@contenteditable="true"][@data-tab="3"]'))
    )
    print("✅ WhatsApp Web loaded. Bot is starting...")

    # === Progress Helpers ===
    def load_progress():
        if os.path.exists(PROGRESS_FILE):
            with open(PROGRESS_FILE, "r") as f:
                data = f.read().strip().split("|")
                if len(data) == 2:
                    return data[0], int(data[1])
        return None, 0

    def save_progress(folder_name, image_index):
        with open(PROGRESS_FILE, "w") as f:
            f.write(f"{folder_name}|{image_index}")

    def clear_progress():
        if os.path.exists(PROGRESS_FILE):
            os.remove(PROGRESS_FILE)

    # === WhatsApp Functions ===
    def open_chat(name):
        search = driver.find_element(By.XPATH, '//div[@contenteditable="true"][@data-tab="3"]')
        search.clear()
        search.send_keys(name)
        print(f"🔍 Searching for chat: {name}")
        time.sleep(4)
        search.send_keys(Keys.ENTER)

    def get_last_message():
        try:
            spans = driver.find_elements(By.XPATH, '//span[@dir="ltr" and contains(@class, "selectable-text")]')
            if spans:
                return spans[-1].text.strip().lower()
        except Exception as e:
            print("❌ Error reading message:", e)
        return ""

    def remove_non_bmp(text):
        return re.sub(r'[^\u0000-\uFFFF]', '', text)

    def send_text_message(message):
        try:
            message = remove_non_bmp(message)
            input_box = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//div[@contenteditable="true"][@data-tab="10"]'))
            )
            input_box.send_keys(message)
            input_box.send_keys(Keys.ENTER)
            print(f"📢 Sent: {message}")
        except Exception as e:
            print("❌ Failed to send text message:", e)

    def send_image(image_path, folder_name):
        try:
            print(f"📂 Uploading: {image_path}")

            plus_icon = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//span[@data-icon="plus-rounded"]'))
            )
            driver.execute_script("arguments[0].click();", plus_icon)
            time.sleep(0.7)

            image_input = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//input[@accept="image/*,video/mp4,video/3gpp,video/quicktime"]'))
            )
            image_input.send_keys(image_path)
            time.sleep(0.7)

            caption_box = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, '//p[contains(@class, "selectable-text") and contains(@class, "copyable-text")]'))
            )
            caption_text = f"*{folder_name}*"
            driver.execute_script("""
                const caption = arguments[0];
                const text = arguments[1];
                caption.focus();
                const selection = window.getSelection();
                const range = document.createRange();
                range.selectNodeContents(caption);
                selection.removeAllRanges();
                selection.addRange(range);
                document.execCommand("insertText", false, text);
            """, caption_box, caption_text)

            send_btn = WebDriverWait(driver, 15).until(
                EC.element_to_be_clickable((By.XPATH, '//div[@role="button"][@aria-label="Send"]'))
            )
            driver.execute_script("arguments[0].click();", send_btn)
            print(f"✅ Sent: {os.path.basename(image_path)}")
            return True

        except Exception:
            print("❌ Failed to send image:")
            traceback.print_exc()
            ts = int(time.time())
            driver.save_screenshot(f"error_screenshot_{ts}.png")
            with open(f"page_source_{ts}.html", "w", encoding="utf-8") as f:
                f.write(driver.page_source)
            return False

    # === Main Execution ===
    open_chat(CHAT_NAME)

    current_folder = None
    image_index = 0
    images = []

    # Load previous session if needed
    saved_folder, saved_index = load_progress()
    if saved_folder:
        current_folder = saved_folder
        image_index = saved_index
        full_path = os.path.join(BASE_FOLDER, current_folder)
        if os.path.exists(full_path):
            images = sorted([
                os.path.join(full_path, f)
                for f in os.listdir(full_path)
                if f.lower().endswith(('.jpg', '.jpeg', '.png'))
            ])
        else:
            clear_progress()
            current_folder = None
            image_index = 0
            images = []

    # === Main Loop ===
    while True:
        last_msg = get_last_message()

        # 🟠 START FROM {folder}
        if last_msg and last_msg.startswith("start "):
            cmd = last_msg.replace("start", "").replace("folder", "").strip().lower()
            subfolders = sorted([
                os.path.join(BASE_FOLDER, d)
                for d in os.listdir(BASE_FOLDER)
                if os.path.isdir(os.path.join(BASE_FOLDER, d))
            ])
            folder_map = {os.path.basename(f).lower(): f for f in subfolders}

            if cmd in folder_map:
                current_folder = os.path.basename(folder_map[cmd])
                images = sorted([
                    os.path.join(folder_map[cmd], f)
                    for f in os.listdir(folder_map[cmd])
                    if f.lower().endswith(('.jpg', '.jpeg', '.png'))
                ])
                image_index = 0
                save_progress(current_folder, 0)
                send_text_message(f"Started {current_folder}")
            else:
                print(f"🚫 Folder '{cmd}' not found.")

        # 🔁 STOP command
        elif last_msg == "stop":
            send_text_message(f"⛔ Stopped {current_folder}")
            clear_progress()
            current_folder = None
            image_index = 0
            images = []

        # 🟢 NEXT command
        elif last_msg == "next" and current_folder and image_index < len(images):
            success = send_image(images[image_index], current_folder)
            if success:
                image_index += 1
                save_progress(current_folder, image_index)
                time.sleep(2)

                if image_index == len(images):
                    send_text_message(f"✅ {current_folder} ended.")
                    clear_progress()
                    current_folder = None
                    image_index = 0
                    images = []

        # 🔄 RESTART
        elif last_msg == "restart":
            clear_progress()
            current_folder = None
            image_index = 0
            images = []
            send_text_message("🔄 Restarted. Waiting for 'start from {folder}'.")

        time.sleep(WAIT_TIME)
