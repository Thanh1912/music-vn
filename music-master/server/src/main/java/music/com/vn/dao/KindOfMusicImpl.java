package music.com.vn.dao;

import music.com.vn.dto.Pagination;
import music.com.vn.model.KindOfMusicEntity;
import music.com.vn.model.KindOfMusicEntity;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository

public class KindOfMusicImpl extends AbstractHibernateDao<KindOfMusicEntity> implements KindOfMusicDao {

	public KindOfMusicImpl() {
        super();
        setClazz(KindOfMusicEntity.class);
    }
	@Autowired
	private SessionFactory sessionFactory;


    @Override
    public KindOfMusicEntity findBySong(Long IdSong) {
        List<KindOfMusicEntity> KindOfMusicEntities = new ArrayList<KindOfMusicEntity>();
        KindOfMusicEntities = sessionFactory.
                getCurrentSession()
                .createQuery("from  KindOfMusicEntity k  join fetch  k.SongEntities s where s.id=?")
                .setParameter(0, IdSong).list();

        if (KindOfMusicEntities.size() > 0) {
            return KindOfMusicEntities.get(0);
        } else {
            return null;
        }
    }

    public List<KindOfMusicEntity> findAll(Pagination page) {
        int totalElementKindOfMusic = count();
        page.setTotalElement(totalElementKindOfMusic);
        int start=page.getPageCurrent()*page.getSize();
        Query query = sessionFactory.getCurrentSession().createQuery("From KindOfMusicEntity");
        query.setFirstResult(start);
        query.setMaxResults(page.getSize());
        List<KindOfMusicEntity> listKindOfMusicEntity  = query.list();
        return listKindOfMusicEntity;
    }

    public int count() {
        int countRow = 0;
        Criteria cr = sessionFactory.getCurrentSession().createCriteria(KindOfMusicEntity.class);
        countRow = cr.list().size();
        return countRow;
    }

    @Override
    public KindOfMusicEntity loadById(Long id) {
        KindOfMusicEntity kindOfMusicEntity=(KindOfMusicEntity)sessionFactory.getCurrentSession().load(KindOfMusicEntity.class,id);
        return kindOfMusicEntity;
    }

}
