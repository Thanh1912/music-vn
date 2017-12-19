package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.SongEntity;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public class SongImpl extends AbstractHibernateDao<SongEntity> implements SongDao {

	public SongImpl() {
        super();
        setClazz(SongEntity.class);
    }

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<SongEntity> findAll(Pagination page) {
		int totalElementUser = count();
		page.setTotalElement(totalElementUser);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession().createQuery("From SongEntity");
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<SongEntity> listSongEntity  = query.list();
		return listSongEntity;
	}
	@Override
	public int count() {
		int countRow = 0;
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(SongEntity.class);
		countRow = cr.list().size();
		return countRow;
	}
	@Override
	public List<SongEntity> findAllByname(Pagination page, String nameSong) {
		int totalElementUser = countByname(nameSong);
		page.setTotalElement(totalElementUser);
		int start=page.getPageCurrent()*page.getSize();
		Query query =sessionFactory.getCurrentSession().createQuery("From SongEntity song  where lower(song.name) like :ss");
		query.setString("ss", "%"+nameSong+"%");
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<SongEntity> listSongEntity  = query.list();
		return listSongEntity;
	}

	@Override
	public List<SongEntity> findAllSongByAlbum(Pagination page, Long id) {
		int totalElementUser = countByAlbum( id);
		page.setTotalElement(totalElementUser);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession()
						.createQuery("From SongEntity song   join fetch  song.AlbumEntities as album  where album.id=?");
		query.setParameter(0,id);
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<SongEntity> listSongEntity  = query.list();
		return listSongEntity;
	}

	@Override
	public List<SongEntity> findAllSongByKindOfMusic(Pagination page, Long id) {
		int totalElementUser = countByAlbum( id);
		page.setTotalElement(totalElementUser);
		int start=page.getPageCurrent()*page.getSize();
		Query query = sessionFactory.getCurrentSession()
				.createQuery("From SongEntity song inner join fetch song.kindOfMusicEntity  kind  where kind.id=?");
		query.setParameter(0,id);
		query.setFirstResult(start);
		query.setMaxResults(page.getSize());
		List<SongEntity> listSongEntity  = query.list();
		return listSongEntity;
	}
	 

	@Override
	public int countByAlbum(Long id) {
		Query query = sessionFactory.getCurrentSession()
						.createQuery("From SongEntity song  inner join song.AlbumEntities as album  where album.id=?");
		query.setParameter(0,id);
		return query.list().size();
	}
	
	@Override
	public int countByname(String nameSong) {
		Query query =sessionFactory.getCurrentSession().createQuery("From SongEntity song  where lower(song.name) like :ss");
		query.setString("ss", "%"+nameSong+"%");
		return query.list().size();
	}
	@Override
	public int countByKinOfMusic(Long id) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("From SongEntity song inner join fetch song.kindOfMusicEntity  kind  where kind.id=?");
		query.setParameter(0,id);
		return 0;
	}

	@Override
	public List<SongEntity> topNewSong() {
		Query query = sessionFactory.getCurrentSession().createQuery("From SongEntity song order by song.createdAt desc");
		query.setMaxResults(20);
		List<SongEntity> listSongEntity  = query.list();
		return listSongEntity;
	}

	@Override
	public SongEntity loadIdUser(Long id) {
		SongEntity songEntity=(SongEntity) sessionFactory.getCurrentSession().load(SongEntity.class, id);
		return songEntity;
	}

	@Override
	public List<SongEntity> findByIdUser(Long id) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("select song From UserEntity user  inner join user.SongEntities as song  where user.id=?");
		query.setParameter(0,id);
		return query.list();
	}

}
