


package music.com.vn.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.com.vn.dto.Pagination;
import music.com.vn.model.UserEntity;

@Repository

public class UserDaoImpl extends AbstractHibernateDao<UserEntity> implements UserDao {

	public UserDaoImpl() {
		super();
		setClazz(UserEntity.class);
	}

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public UserEntity findByEmail(String email) {
		List<UserEntity> users = new ArrayList<UserEntity>();
		users = sessionFactory.getCurrentSession().createQuery("from UserEntity u where u.email=?")
				.setParameter(0, email).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}


	public List<UserEntity> findAll(Pagination page) {
		int totalElementUser = count();
		page.setTotalElement(totalElementUser);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("From UserEntity");
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<UserEntity> listUserEntity  = query.list();
		return listUserEntity;
	}

	public int count() {
		int countRow = 0;
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(UserEntity.class);
		countRow = cr.list().size();
		return countRow;
	}

	@Override
	public UserEntity LoadById(Long id) {
		UserEntity userEntity=(UserEntity) sessionFactory.getCurrentSession().load(UserEntity.class,id);
		return userEntity;
	}

}

