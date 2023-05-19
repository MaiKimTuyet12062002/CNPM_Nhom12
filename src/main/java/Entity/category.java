package Entity;

import java.io.Serializable;

public class category implements Serializable {
    private int idCat;
    private String nameCat;

    public category(){

    }

    public category(int idCat, String nameCat) {
        this.idCat = idCat;
        this.nameCat = nameCat;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getNameCat() {
        return nameCat;
    }

    public void setNameCat(String nameCat) {
        this.nameCat = nameCat;
    }

    @Override
    public String toString() {
        return "category{" +
                "idCat=" + idCat +
                ", nameCat='" + nameCat + '\'' +
                '}';
    }
}
