package remove_control_flag15;

public class Friends {
    private String[] friends;

    public Friends (String[] friends) {
        this.friends = friends;
    }

    public int indexOf (String friend) {
        int i = 0;

        while (i < friends.length ) {
            if (friends[i].equals(friend)) {
                return i;
            }
            i++;
        } return -1;


    }
}
