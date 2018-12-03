package cn.lollipop.schedule.util;

public class RandomUtil {
    private short[] array;
    private int range;
    private int index;

    public RandomUtil(int range) {
        this.array = new short[range];
        for (int i = 0; i < range; i++) {
            array[i] = (short)i;
        }
        this.range = range;
    }

    public short getRandomInt() {
        if (range == 0) {
            return 0;
        }

        index = (int) (range * Math.random());
        return array[index];
    }

    public void remove() {
        array[index] = array[--range];
    }
}
