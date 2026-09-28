package encasulate_collection29;

import java.util.ArrayList;
import java.util.Date;

public class Team  {
    private String name;
    private Date creation;
    private ArrayList<Player> players = new ArrayList<Player>();

    public Team(String name, Date creation) {
        this.name = name;
        this.creation = creation;
    }

    public String getName() {
        return name;
    }

    public Date getCreation() {
        return creation;
    }

    public Player getPlayers(int index) {
        return players.get(index);
    }

    public void addPlayer(Player player) {
        players.add(player);

    }
    public void removePlayer(Player player) {
        players.remove(player);

    }
    public int totalPlayers() {
        return players.size();
    }
}
