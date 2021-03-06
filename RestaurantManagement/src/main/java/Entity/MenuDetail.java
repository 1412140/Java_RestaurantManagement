package Entity;
// Generated Dec 21, 2017 7:10:52 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * MenuDetail generated by hbm2java
 */
public class MenuDetail  implements java.io.Serializable {


     private Integer id;
     private int menuId;
     private int idDish;
     private Date createdAt;
     private int delFlag;

    public MenuDetail() {
    }

    public MenuDetail(int menuId, int idDish, Date createdAt, int delFlag) {
       this.menuId = menuId;
       this.idDish = idDish;
       this.createdAt = createdAt;
       this.delFlag = delFlag;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getMenuId() {
        return this.menuId;
    }
    
    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }
    public int getIdDish() {
        return this.idDish;
    }
    
    public void setIdDish(int idDish) {
        this.idDish = idDish;
    }
    public Date getCreatedAt() {
        return this.createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    public int getDelFlag() {
        return this.delFlag;
    }
    
    public void setDelFlag(int delFlag) {
        this.delFlag = delFlag;
    }




}


