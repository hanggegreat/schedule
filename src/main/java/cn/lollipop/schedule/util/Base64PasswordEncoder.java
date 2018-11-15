package cn.lollipop.schedule.util;

import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Base64;

public class Base64PasswordEncoder implements PasswordEncoder {
    private final static String SALT = "lixing";
    private final static int REPEAT = 5;

    public String encode(CharSequence charSequence) {
        String temp = charSequence + "{" + SALT + "}";
        byte[] data = temp.getBytes();

        for (int i = 0; i < REPEAT; i++) {
            data = Base64.getEncoder().encode(data);
        }

        return new String(data);
    }

    public boolean matches(CharSequence charSequence, String s) {
        if (s == null || charSequence == null) {
            return false;
        }
        return charSequence.equals(decode(s));
    }

    private String decode(CharSequence charSequence) {
        byte[] data = charSequence.toString().getBytes();

        for (int i = 0; i < REPEAT; i++) {
            data = Base64.getDecoder().decode(data);
        }
        String str = new String(data);
        return str.substring(0, str.lastIndexOf("{"));
    }
}
