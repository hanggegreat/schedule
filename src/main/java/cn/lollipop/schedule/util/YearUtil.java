package cn.lollipop.schedule.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class YearUtil {
    public static String getCurrentYear() {
        return new SimpleDateFormat("YYYY").format(new Date());
    }
}
