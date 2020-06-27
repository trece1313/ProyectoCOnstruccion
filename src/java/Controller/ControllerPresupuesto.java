/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConectaDB;
import Model.DetalleServicioPresupuesto;
import Model.Obra;
import Model.Presupuesto;

import ModelDAO.PresupuestoDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trece
 */
public class ControllerPresupuesto implements PresupuestoDAO{
    PreparedStatement ps = null;
    ResultSet rs = null;
    ConectaDB conDB = null;
    Connection con = null;
    


    @Override
    public Obra agregarPresupuesto(Obra obra, DetalleServicioPresupuesto nuevo) {
              int existe=0;
              
              System.out.println("uno "+nuevo.getAltura());
              System.out.println("uno "+nuevo.getLargo());
              System.out.println("uno "+nuevo.getSubtotalDetalle());
              
        for(int i=0;i<obra.getDetSerPreObra().size();i++)
        {
            DetalleServicioPresupuesto det=obra.getDetSerPreObra().get(i);
            if(nuevo.getServicioDetalle().getId_Servicio()==det.getServicioDetalle().getId_Servicio())
            {
                det.setMetrosCuadradoDetalle(det.getMetrosCuadradoDetalle()+(nuevo.getAltura()*nuevo.getLargo()));
                det.setSubtotalDetalle(det.getSubtotalDetalle()+(det.getPrecioMetro()*nuevo.getAltura()*nuevo.getLargo()));
                i=obra.getDetSerPreObra().size();
                existe=1;
            }
        }
        if(existe==0)
        {
            
            obra.getDetSerPreObra().add(nuevo);
        }
        
        obra.setTotal_Obra((obra.getTotal_Obra()+nuevo.getSubtotalDetalle()));
        return obra;
    }

    @Override
    public ArrayList<Obra> showDataCliente(String f) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Obra> showAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Obra t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Obra t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Obra t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Obra adds(Obra t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 
    
}
