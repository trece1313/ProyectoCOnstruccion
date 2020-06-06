/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author trece
 */
public class Rol 
{
    private int id_Rol;
    private String nombre_Rol;
    private int activo_Rol;

    public Rol() 
    {
        this.id_Rol = 0;
        this.nombre_Rol = "";
        this.activo_Rol = 0;
    }

    
    
    public int getId_Rol() {
        return id_Rol;
    }

    public void setId_Rol(int id_Rol) {
        this.id_Rol = id_Rol;
    }

    public String getNombre_Rol() {
        return nombre_Rol;
    }

    public void setNombre_Rol(String nombre_Rol) {
        this.nombre_Rol = nombre_Rol;
    }

    public int getActivo_Rol() {
        return activo_Rol;
    }

    public void setActivo_Rol(int activo_Rol) {
        this.activo_Rol = activo_Rol;
    }
    
    
    
}
