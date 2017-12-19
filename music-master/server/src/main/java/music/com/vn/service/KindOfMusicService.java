package music.com.vn.service;

import music.com.vn.dto.CollectionKindOfMusicDTO;
import music.com.vn.dto.KindOfMusicDTO;
import music.com.vn.dto.Pagination;

import java.util.List;

public interface KindOfMusicService {

	public KindOfMusicDTO save(KindOfMusicDTO KindOfMusic);

	public KindOfMusicDTO update(KindOfMusicDTO KindOfMusic);

	public boolean delete(Long id);

	public KindOfMusicDTO findOne(Long id);

	public CollectionKindOfMusicDTO findAll(Pagination page) ;

	public List<KindOfMusicDTO> findAll();

}
