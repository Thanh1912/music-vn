package music.com.vn.dao;

import java.io.Serializable;
import java.util.List;

public interface IOperations<T extends Serializable> {

    T findOne(final long id);

    List<T> findAll();

    Long create(final T entity);

    public void saveOrUpdate(final T entity);

    T update(final T entity);

    void delete(final T entity);

    void deleteById(final long entityId);

}
