module button;

import stmbridge;
import clock;

private enum BUTTON_INTERVAL = 50;
public enum KeyState { IDLE, PRESSED, RELEASED }

struct Button {
    uint GPIO_BANK;
    ushort GPIO_PIN;
    ulong next_time;
    bool last_state = true;
    bool current_state = true;

    this(uint bank, ushort pin) {
        GPIO_BANK = bank;
        GPIO_PIN = pin;
    }

    KeyState keyChange() {
        KeyState keyState = KeyState.IDLE;
        bool state = gpio_get(GPIO_BANK, GPIO_PIN) == GPIO_PIN;
        if (state != last_state)  {
            next_time = system_millis + BUTTON_INTERVAL;
        }
        if (next_time < system_millis) {
            if (current_state != state) {
                current_state = state;

                keyState = current_state ? KeyState.PRESSED : KeyState.RELEASED;
            }
        }
        last_state = state;
        return keyState;
    }

    bool keyDown() {
        return keyChange() == KeyState.PRESSED;
    }

    bool keyUp() {
        return keyChange == KeyState.RELEASED;
    }
}
