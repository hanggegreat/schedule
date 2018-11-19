package cn.lollipop.schedule.util;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomerPasswordEncoder implements PasswordEncoder {
    public String encode(CharSequence charSequence) {
        return charSequence.toString();
    }

    public boolean matches(CharSequence charSequence, String s) {
        if (s == null || charSequence == null) {
            return false;
        }
        return charSequence.equals(decode(s));
    }

    private String decode(CharSequence charSequence) {
        return charSequence.toString();
    }
}
