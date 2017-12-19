package music.com.vn.service;

import music.com.vn.dao.*;
import music.com.vn.dto.*;
import music.com.vn.model.*;
import music.com.vn.utils.Utils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SongServiceImpl implements SongService {

    @Autowired
    private SongDao songDAO;
    @Autowired
    private UserDao userDAO;

    @Autowired
    private UserService userService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private AlbumDAO albumDao;

    @Autowired
    private ArtistDao artistDao;

    @Autowired
    private ArtistService artistService;

    @Autowired

    private KindOfMusicService kindOfMusicService;

    @Autowired
    private KindOfMusicDao kindOfMusicDao;

    @Autowired
    private ModelMapper modelMapper;

    private List<SongDTO> convertCollectionToDTO(List<SongEntity> listSongEntity) {
        List<SongDTO> listDTO = new ArrayList<>();
        for (SongEntity SongEntity : listSongEntity) {
            SongDTO dto = modelMapper.map(SongEntity, SongDTO.class);
            dto = setDTORef(dto, SongEntity);
            listDTO.add(dto);
        }
        return listDTO;
    }
    private CollectionSongDTO setCollectionDTO(List<SongDTO> list, Pagination page) {
        CollectionSongDTO listcollection = new CollectionSongDTO();
        listcollection.setPage(page);
        listcollection.setListDTo(list);
        return listcollection;
    }
    @Override
    public SongDTO save(SongDTO song) {
        if (!isExistUser(song.getIdUser())) {
            throw new BadCredentialsException("User not exist!");
        }
        SongEntity DtotoEntity = modelMapper.map(song, SongEntity.class);
        SongDTO songDto = new SongDTO();
        Date date = new Date();
        DtotoEntity.setModifiedAt(date);
        DtotoEntity.setCreatedAt(date);
        String poster = song.getPoster();
        if (poster != null)
            DtotoEntity.setPoster(Utils.writeOrUpdate("song", poster));
        String image = song.getPoster();
        if (image != null)
            DtotoEntity.setThumb(Utils.writeOrUpdate("song", image));
        DtotoEntity.setAlbumEntities(list_Song_Album(song));
        DtotoEntity.setKindOfMusicEntity(kindOfMusicDao.loadById(song.getIdKindOfMusic()));
        DtotoEntity.setArtistEntities(list_Song_Artist(song));
        DtotoEntity.setUserEntity(userDAO.LoadById(song.getIdUser()));
        Long id = songDAO.create(DtotoEntity);
        SongEntity songEntity = songDAO.findOne(id);
        songDto = modelMapper.map(songEntity, SongDTO.class);
        setDTORef(songDto, songEntity);
        return songDto;
    }

    private List<AlbumEntity> list_Song_Album(SongDTO song) {
        Long id = song.getIdAlbum();
        List<AlbumEntity> list = new ArrayList<>();
        if (id > 0) {
            AlbumEntity albumEntity = albumDao.loadId(id);
            list.add(albumEntity);
        } else {
            throw new BadCredentialsException("Require Album for song");
        }
        return list;
    }

    private List<ArtistEntity> list_Song_Artist(SongDTO song) {
        List<ArtistEntity> list = new ArrayList<>();
        ArtistEntity artistEntity = artistDao.loadId(song.getIdArtist());
        list.add(artistEntity);
        return list;
    }

    private boolean isExistUser(Long id) {
        if (userDAO.findOne(id) != null)
            return true;
        return false;
    }

    @Override
    public SongDTO update(SongDTO Song) {
        SongEntity entity = modelMapper.map(Song, SongEntity.class);
        String thumb = Song.getPoster();
        Date date = new Date();
        entity.setModifiedAt(date);
        if (thumb != null)
            entity.setPoster(Utils.writeOrUpdate("song", thumb));
        entity.setAlbumEntities(list_Song_Album(Song));
        entity.setKindOfMusicEntity(kindOfMusicDao.loadById(Song.getIdKindOfMusic()));
        entity.setArtistEntities(list_Song_Artist(Song));
        entity.setUserEntity(userDAO.LoadById(Song.getIdUser()));
        SongEntity result = songDAO.update(entity);
        return modelMapper.map(result, SongDTO.class);
    }

    @Override
    public boolean delete(Long id) {
        if (songDAO.findOne(id) == null) {
            return false;
        }
        songDAO.deleteById(id);
        return true;
    }

    @Override
    public SongDTO findOne(Long id) {
        if (id <= 0) {
            return null;
        }
        SongEntity songentity = songDAO.findOne(id);
        SongDTO songDTO = modelMapper.map(songDAO.findOne(id), SongDTO.class);
        setDTORef(songDTO, songentity);
        if (songentity == null) {
            return null;
        }
        return songDTO;
    }

    private SongDTO setDTORef(SongDTO songdto, SongEntity songentity) {
        List<AlbumDTO> listAlbumDTO = setListAlbumDTO(songentity);
        List<ArtistDTO> listArtistDTO = setListArtistDTO(songentity);
        String byKindOfMusic = setValueNameKindOfMusic(songentity);
        songdto.setNameKindOfMusic(byKindOfMusic);
        songdto.setInfoByNameAuthor(setValueByNameAuthor(songentity));
        songdto.setAlbumDTO(listAlbumDTO);
        songdto.setArtistDTO(listArtistDTO);
        return songdto;
    }

    private InfoUserDTO setValueByNameAuthor(SongEntity songentity) {
        UserEntity userEntity = songentity.getUserEntity();
        if (userEntity == null) {
            return null;
        }
        InfoUserDTO userDTO = modelMapper.map(userEntity, InfoUserDTO.class);
        return userDTO;
    }

    private String setValueNameKindOfMusic(SongEntity songentity) {
        KindOfMusicEntity kind = kindOfMusicDao.findBySong(songentity.getId());
        String result = "";
        if (kind == null) {
            return "";
        }
        KindOfMusicDTO dto = modelMapper.map(kind, KindOfMusicDTO.class);
        result = dto.getName();
        return result;
    }

    private List<ArtistDTO> setListArtistDTO(SongEntity songentity) {
        List<ArtistEntity> Artist = songentity.getArtistEntities();
        List<ArtistDTO> listDTO = new ArrayList<>();
        for (ArtistEntity artistEntity : Artist) {
            listDTO.add(modelMapper.map(artistEntity, ArtistDTO.class));
        }
        return listDTO;
    }


    private List<AlbumDTO> setListAlbumDTO(SongEntity songentity) {
        List<AlbumEntity> Album = songentity.getAlbumEntities();
        List<AlbumDTO> listDTO = new ArrayList<>();
        for (AlbumEntity albumEntity : Album) {
            listDTO.add(modelMapper.map(albumEntity, AlbumDTO.class));
        }
        return listDTO;
    }


    @Override
    public CollectionSongDTO findAllSong(Pagination page) {
        List<SongEntity> listSongEntity = songDAO.findAll(page);
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        int totalElementSong = songDAO.count();
        page.setTotalElement(totalElementSong);
        return setCollectionDTO(listSongDTO, page);
    }

    @Override
    public CollectionSongDTO findAllSongByName(Pagination page, String name) {
        List<SongEntity> listSongEntity = songDAO.findAllByname(page, name);
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        int totalElementSong = songDAO.countByname(name);
        page.setTotalElement(totalElementSong);
        return setCollectionDTO(listSongDTO, page);
    }

    @Override
    public CollectionSongDTO findAllSongByAlbum(Pagination page, Long id) {
        List<SongEntity> listSongEntity = songDAO.findAllSongByAlbum(page, id);
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        int totalElementSong = songDAO.countByAlbum(id);
        page.setTotalElement(totalElementSong);
        return setCollectionDTO(listSongDTO, page);
    }

    @Override
    public CollectionSongDTO findAllSongByKindOfMusic(Pagination page, Long id) {
        List<SongEntity> listSongEntity = songDAO.findAllSongByKindOfMusic(page, id);
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        int totalElementSong = songDAO.countByKinOfMusic(id);
        page.setTotalElement(totalElementSong);
        return setCollectionDTO(listSongDTO, page);
    }

    @Override
    public List<SongDTO> topNewSong() {
        List<SongEntity> listSongEntity = songDAO.topNewSong();
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        return listSongDTO;
    }


    @Override
    public List<SongDTO> findByIdUser(Long id) {
        List<SongEntity> listSongEntity =  songDAO.findByIdUser(id);
        List<SongDTO> listSongDTO = convertCollectionToDTO(listSongEntity);
        return listSongDTO;
    }


}
