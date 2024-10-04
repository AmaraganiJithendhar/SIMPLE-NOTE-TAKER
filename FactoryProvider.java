
package com.pulse.Helper;
import org.hibernate.cfg.Configuration;

import org.hibernate.SessionFactory;

public class FactoryProvider {
    public static SessionFactory factory;
    public static SessionFactory getFactory(){
        if(factory==null){
            factory=new Configuration().configure("hibernate.con.xml").buildSessionFactory();
        }
        return factory;
    }
    public void closeFactory(){
        if(factory.isOpen()){
            factory.close();
        }
    }   
}
