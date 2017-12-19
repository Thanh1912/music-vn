package music.com.vn.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "song")
public class SongEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Column
    private Date modifiedAt;

    @Column
    private Date createdAt;

    public String hostMovieId;

    public String name;

    public String thumb;

    public String poster;

    private Integer countWatch;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(Date modifiedAt) {
        this.modifiedAt = modifiedAt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }


    public String getHostMovieId() {
        return hostMovieId;
    }

    public void setHostMovieId(String hostMovieId) {
        this.hostMovieId = hostMovieId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Integer getCountWatch() {
        return countWatch;
    }
    public void setCountWatch(Integer countWatch) {
        this.countWatch = countWatch;
    }


    @ManyToOne(cascade =
            {
                    CascadeType.PERSIST,
            })
    @JoinColumn(name = "user_id")
    private UserEntity userEntity;
    @ManyToOne(cascade =
            {
                    CascadeType.PERSIST,
            })
    @JoinColumn(name = "kindofmusic_id")
    private KindOfMusicEntity kindOfMusicEntity;



    @ManyToMany(fetch = FetchType.LAZY, cascade =
            {
                    CascadeType.DETACH,
                    CascadeType.MERGE,
                    CascadeType.REFRESH,
                    CascadeType.PERSIST
            })
    @JoinTable(name = "Album_Song", joinColumns = {@JoinColumn(name = "Song_id")}, inverseJoinColumns = {
            @JoinColumn(name = "Album_id")})
    private List<AlbumEntity> AlbumEntities;

    @ManyToMany(fetch = FetchType.LAZY, cascade =
            {
                    CascadeType.DETACH,
                    CascadeType.MERGE,
                    CascadeType.REFRESH,
                    CascadeType.PERSIST
            })
    @JoinTable(name = "Artist_Song", joinColumns = {@JoinColumn(name = "Song_id")}, inverseJoinColumns = {
            @JoinColumn(name = "Artist_id")})
    List<ArtistEntity> ArtistEntities;


    public List<AlbumEntity> getAlbumEntities() {
        return AlbumEntities;
    }

    public void setAlbumEntities(List<AlbumEntity> albumEntities) {
        AlbumEntities = albumEntities;
    }

    public List<ArtistEntity> getArtistEntities() {
        return ArtistEntities;
    }

    public void setArtistEntities(List<ArtistEntity> artistEntities) {
        ArtistEntities = artistEntities;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public KindOfMusicEntity getKindOfMusicEntity() {
        return kindOfMusicEntity;
    }

    public void setKindOfMusicEntity(KindOfMusicEntity kindOfMusicEntity) {
        this.kindOfMusicEntity = kindOfMusicEntity;
    }
}
