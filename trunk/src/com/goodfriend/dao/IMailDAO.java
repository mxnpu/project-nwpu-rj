/**
 * 
 */
package com.goodfriend.dao;

import java.util.List;

import com.goodfriend.model.Mail;

/**
 * @author 
 *
 */
public interface IMailDAO {

    public abstract void save(Mail transientInstance);

    public abstract void delete(Mail persistentInstance);

    public abstract Mail findById(java.lang.Integer id);

    public abstract List<Mail> findByExample(Mail instance);

    public abstract List<Mail> findByProperty(String propertyName, Object value);

    public abstract List<Mail> findByTitle(Object title);

    public abstract List<Mail> findByContent(Object content);

    public abstract List<Mail> findAll();

    public abstract Mail merge(Mail detachedInstance);

    public abstract void attachDirty(Mail instance);

    public abstract void attachClean(Mail instance);

}