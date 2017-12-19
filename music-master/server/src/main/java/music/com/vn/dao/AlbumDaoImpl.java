package music.com.vn.dao;
import java.util.ArrayList;
import java.util.List;

import music.com.vn.dto.UserDTO;
import music.com.vn.model.UserEntity;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.com.vn.dto.Pagination;
import music.com.vn.model.AlbumEntity;

import static java.lang.Math.toIntExact;

@Repository
public class AlbumDaoImpl extends AbstractHibernateDao<AlbumEntity> implements AlbumDAO {

	public AlbumDaoImpl() {
        super();
        setClazz(AlbumEntity.class);
    }
	@Autowired
	private SessionFactory sessionFactory;
	public List<AlbumEntity> findAll(Pagination page) {
		int totalElementAlbum = count();
		page.setTotalElement(totalElementAlbum);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("From AlbumEntity");
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<AlbumEntity> listAlbumEntity  = query.list();
		return listAlbumEntity;
	}

	@Override
	public List<AlbumEntity> TopNew() {
		Query query = sessionFactory.getCurrentSession().createQuery("From AlbumEntity al order by al.createdAt desc");
		query.setMaxResults(20);
		List<AlbumEntity> listAlbumEntity  = query.list();
		return listAlbumEntity;
	}

	@Override
	public UserEntity findUserByIdAlbum(Long idAlbum) {
		List<UserEntity> users = new ArrayList<>();
		users = sessionFactory.getCurrentSession().createQuery("from UserEntity u inner join u.AlbumEntities al where al.id=?")
				.setParameter(0, idAlbum).list();
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}

	public int count() {
		int countRow = 0;
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(AlbumEntity.class);
		countRow = cr.list().size();
		return countRow;
	}

	@Override
	public AlbumEntity loadId(Long id) {
		AlbumEntity albumEntity=(AlbumEntity)sessionFactory.getCurrentSession().load(AlbumEntity.class,id);
		return albumEntity;
	}

	@Override
	public List<AlbumEntity> findbyArtist(Pagination page,Long id) {
		//Long convertInt=new Long();
		int totalElementAlbum = toIntExact(countbyArtist(id));
		page.setTotalElement(totalElementAlbum);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("select album From AlbumEntity album join  album.artistEntity artist where artist.id=?");
		query.setParameter(0,id);
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<AlbumEntity> listAlbumEntity  = query.list();
		return listAlbumEntity;
	}

	@Override
	public List<AlbumEntity> findbyUser(Pagination page, Long id) {
		int totalElementAlbum = toIntExact(countbyUser(id));
		page.setTotalElement(totalElementAlbum);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("select album From UserEntity user join  user.AlbumEntities album where user.id=?");
		query.setParameter(0,id);
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<AlbumEntity> listAlbumEntity  = query.list();
		return listAlbumEntity;
	}
	@Override
	public Long countbyUser(Long id) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("select count(*) From UserEntity user join  user.AlbumEntities album where user.id=?");
		query.setParameter(0, id);
		return (Long) query.uniqueResult();
	}
	public Long countbyArtist(Long idSong) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("select count(*) From AlbumEntity album join  album.artistEntity artist where artist.id=?");
		query.setParameter(0, idSong);
		return (Long) query.uniqueResult();

	}




}
