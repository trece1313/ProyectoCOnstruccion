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
public class Usuario 
{
    private int id;
    private String userName;      
    private String passUsuario;
    private int activo;
    Persona personaUsuario;
    Rol rolUsuario;

    public Usuario() 
    {
        this.id = 0;
        this.userName = "";
        this.passUsuario = "";
        this.activo = 0;
        this.rolUsuario = new Rol();
        this.personaUsuario = new Persona();
    }

    
    
    
    public Persona getPersonaUsuario() {
        return personaUsuario;
    }

    public void setPersonaUsuario(Persona personaUsuario) {
        this.personaUsuario = personaUsuario;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassUsuario() {
        return passUsuario;
    }

    public void setPassUsuario(String passUsuario) {
        this.passUsuario = passUsuario;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

    public Rol getRolUsuario() {
        return rolUsuario;
    }

    public void setRolUsuario(Rol rolUsuario) {
        this.rolUsuario = rolUsuario;
    }
    
    
            
            
}
