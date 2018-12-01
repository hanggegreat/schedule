package cn.lollipop.schedule.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class YearUtil {

    public static String getCurrentYear() {
        Date date = new Date();
        if (new SimpleDateFormat("mm").format(date).compareTo("08") > 0) {
            return new SimpleDateFormat("YYYY").format(new Date());
        }
        return String.valueOf(Integer.parseInt(new SimpleDateFormat("YYYY").format(new Date())) - 1);
    }
}
