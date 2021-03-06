package ru.bramblehorse.cms.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;
import ru.bramblehorse.cms.dao.AbstractDao;
import ru.bramblehorse.cms.model.commerce.CatalogCategoryFilter;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: bramblehorse
 * Date: 28.11.13
 * Time: 22:41
 * To change this template use File | Settings | File Templates.
 */
public class HibernateCatalogCategoryFilterDao implements AbstractDao<CatalogCategoryFilter> {

    @Autowired
    HibernateTemplate ht;

    @Transactional
    @Override
    public Integer create(CatalogCategoryFilter entity) {

        return (Integer)ht.save(entity);
    }

    @Transactional
    @Override
    public void delete(Integer id) {

        CatalogCategoryFilter temp = ht.load(CatalogCategoryFilter.class, id);
        ht.delete(temp);
    }

    @Transactional
    @Override
    public void edit(CatalogCategoryFilter entity) {

        ht.update(entity);
    }

    @Transactional
    @Override
    public CatalogCategoryFilter getById(Integer id) {

        return ht.load(CatalogCategoryFilter.class, id);
    }

    @Transactional
    @Override
    public List<CatalogCategoryFilter> getAll() {

        return ht.loadAll(CatalogCategoryFilter.class);
    }

}
