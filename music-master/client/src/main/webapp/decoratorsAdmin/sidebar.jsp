<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside class="bg-black dk nav-xs aside hidden-print" id="nav">
    <section class="vbox">
        <section class="w-f-md scrollable">
            <div class="slim-scroll" data-height="auto"
                 data-disable-fade-out="true" data-distance="0" data-size="10px"
                 data-railOpacity="0.2">
                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                    <ul class="nav bg clearfix">

                        <li><a href="<%=request.getContextPath()%>/admin/dashboard"> <i
                                class="icon-disc icon text-success"></i> <span class="font-bold">Home</span>
                        </a></li>
                        <li><a href="<%=request.getContextPath()%>/admin/user"> <i
                                class="icon-users icon text-info"></i> <span
                                class="font-bold">User</span>
                        </a></li>

                        <li>
                            <a href="<%=request.getContextPath()%>/admin/artist" class="auto">
                                <i class="icon-star icon">
                                </i>
                                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Nghệ sĩ</font></font></span>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/admin/kind-of-music" class="auto">
                                <i class="icon-music-tone-alt icon">
                                </i>
                                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Thể loại </font></font></span>
                            </a>
                        </li>


                    </li>
                    </ul>
                </nav>
                <!-- / nav -->
            </div>
        </section>
    </section>
</aside>


