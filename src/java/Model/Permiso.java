/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.awt.Menu;

/**
 *
 * @author trece
 */
public class Permiso 
{
    private int id_Permiso;
    Menu menPermiso;
    Rol rolPermiso;

    public Permiso() {
        this.id_Permiso = 0;
        this.menPermiso = new Menu();
        this.rolPermiso = new Rol();
    }

    
    
    
    public int getId_Permiso() {
        return id_Permiso;
    }

    public void setId_Permiso(int id_Permiso) {
        this.id_Permiso = id_Permiso;
    }

    public Menu getMenPermiso() {
        return menPermiso;
    }

    public void setMenPermiso(Menu menPermiso) {
        this.menPermiso = menPermiso;
    }

    public Rol getRolPermiso() {
        return rolPermiso;
    }

    public void setRolPermiso(Rol rolPermiso) {
        this.rolPermiso = rolPermiso;
    }
    
    
}
