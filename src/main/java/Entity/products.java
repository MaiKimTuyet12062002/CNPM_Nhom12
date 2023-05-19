package Entity;

import java.io.Serializable;

public class products implements Serializable {
    private int idProduct;

    private int idCat;
    private String nameProduct;
    private String image;
    private String description;
    private Integer price;

    public products(){

    }

    public products(int idProduct, int idCat, String nameProduct, String image, String description, Integer price) {
        this.idProduct = idProduct;
        this.idCat = idCat;
        this.nameProduct = nameProduct;
        this.image = image;
        this.description = description;
        this.price = price;
    }


    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "products{" +
                "idProduct=" + idProduct +
                ", nameProduct='" + nameProduct + '\'' +
                ", image='" + image + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}
