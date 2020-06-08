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
public class Persona 
{
    private int id_Primary;
    private int foreign_Key;
    private int secondary_Key;
    private int foranea_Key;
    private String nombre_Persona;
    private String paterno_Persona;
    private String materno_Persona;       
    private String fechaNacimiento_Persona;
    private String sexo_Persona;
    private String telefono_Persona;
    private String correo_Persona;

    public Persona() 
    {
        this.id_Primary = 0;
        this.foreign_Key = 0;
        this.secondary_Key = 0;
        this.foranea_Key = 0;
        this.nombre_Persona = "";
        this.paterno_Persona = "";
        this.materno_Persona = "";
        this.fechaNacimiento_Persona = "";
        this.sexo_Persona = "";
        this.telefono_Persona = "";
        this.correo_Persona = "";
    }

    public int getId_Primary() {
        return id_Primary;
    }

    public void setId_Primary(int id_Primary) {
        this.id_Primary = id_Primary;
    }

    public int getForeign_Key() {
        return foreign_Key;
    }

    public void setForeign_Key(int foreign_Key) {
        this.foreign_Key = foreign_Key;
    }

    public int getSecondary_Key() {
        return secondary_Key;
    }

    public void setSecondary_Key(int secondary_Key) {
        this.secondary_Key = secondary_Key;
    }

    public int getForanea_Key() {
        return foranea_Key;
    }

    public void setForanea_Key(int foranea_Key) {
        this.foranea_Key = foranea_Key;
    }

    public String getNombre_Persona() {
        return nombre_Persona;
    }

    public void setNombre_Persona(String nombre_Persona) {
        this.nombre_Persona = nombre_Persona;
    }

    public String getPaterno_Persona() {
        return paterno_Persona;
    }

    public void setPaterno_Persona(String paterno_Persona) {
        this.paterno_Persona = paterno_Persona;
    }

    public String getMaterno_Persona() {
        return materno_Persona;
    }

    public void setMaterno_Persona(String materno_Persona) {
        this.materno_Persona = materno_Persona;
    }

    public String getFechaNacimiento_Persona() {
        return fechaNacimiento_Persona;
    }

    public void setFechaNacimiento_Persona(String fechaNacimiento_Persona) {
        this.fechaNacimiento_Persona = fechaNacimiento_Persona;
    }

    public String getSexo_Persona() {
        return sexo_Persona;
    }

    public void setSexo_Persona(String sexo_Persona) {
        this.sexo_Persona = sexo_Persona;
    }

    public String getTelefono_Persona() {
        return telefono_Persona;
    }

    public void setTelefono_Persona(String telefono_Persona) {
        this.telefono_Persona = telefono_Persona;
    }

    public String getCorreo_Persona() {
        return correo_Persona;
    }

    public void setCorreo_Persona(String correo_Persona) {
        this.correo_Persona = correo_Persona;
    }
    
    
    
       
            
}
