package cn.lollipop.schedule.util;

public class NumToString {
    public static String convert(int num) {
        return num < 10 ? ("0" + num) : String.valueOf(num);
    }
}
