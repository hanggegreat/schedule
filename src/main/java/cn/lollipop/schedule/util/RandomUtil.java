package cn.lollipop.schedule.util;

public class RandomUtil {
    private short[] array;
    private int range;
    private int index;

    public RandomUtil(int range) {
        this.array = new short[range];
        for (int i = 0; i < range; i++) {
            array[i] = (short) i;
        }
        this.range = range;
    }

    public short getRandomInt() {
        index = (int) (range * Math.random());
        return array[index];
    }

    public void remove() {
        if (range == 0) {
            range--;
        } else {
            array[index] = array[--range];
        }
    }
}
