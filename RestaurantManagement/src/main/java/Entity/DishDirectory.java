package Entity;
// Generated Nov 24, 2017 1:39:03 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * DishDirectory generated by hbm2java
 */
public class DishDirectory  implements java.io.Serializable {


     private Integer id;
     private String name;
     private Date createdAt;
     private int delFlag;

    public DishDirectory() {
    }

    public DishDirectory(String name, Date createdAt, int delFlag) {
       this.name = name;
       this.createdAt = createdAt;
       this.delFlag = delFlag;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
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


