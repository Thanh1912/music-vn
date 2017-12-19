package music.com.vn.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.com.vn.dto.Pagination;
import music.com.vn.model. ArtistEntity;

@Repository

public class ArtistDaoImpl extends AbstractHibernateDao<ArtistEntity> implements ArtistDao {

	public ArtistDaoImpl() {
		super();
		setClazz(ArtistEntity.class);
	}

	@Autowired
	private SessionFactory sessionFactory;

	public List< ArtistEntity> findAll(Pagination page) {
		int totalElementArtist = count();
		page.setTotalElement(totalElementArtist);
		int start = page.getPageCurrent() * page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("From  ArtistEntity");
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List< ArtistEntity> listArtistEntity = query.list();
		return listArtistEntity;
	}

	public int count() {
		int countRow = 0;
		Criteria cr = sessionFactory.getCurrentSession().createCriteria( ArtistEntity.class);
		countRow = cr.list().size();
		return countRow;
	}

	@Override
	public ArtistEntity loadId(Long id) {
		ArtistEntity artistEntity =(ArtistEntity) sessionFactory.getCurrentSession().load(ArtistEntity.class,id);
		return artistEntity;
	}
}
