<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
  </head>
  <body>
  	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="body">
        <div class="left-body">
            <div class="feed-box">
                <div class="profile">
                    <div class="profile-img-box">
                        <img class="profile-img"
                            src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
                    </div>
                    <div class="profile-id">
                        jollyn
                    </div>
                </div>

                <div class="feed-img">
                    <img id="feed-img"
                        src="https://static-storychat.pstatic.net/2020/9/1/47/208797_hm2fj34m3df60.jpg">
                </div>

                <div class="icon">
                    <div>
                        <span class="material-icons-outlined">favorite_border</span>
                        <span class="material-icons-outlined">chat_bubble_outline</span>
                        <span class="material-icons-outlined">send</span>
                    </div>
                    <div>
                        <span class="material-icons-outlined">bookmark_border</span>
                    </div>
                </div>

                <div class="like">
                    django <b>외 19명</b>이 좋아합니다
                </div>

                <div class="feed-text">
                    <b>jollyn</b> 이건 마치 알고리즘 보는 나의 모습
                </div>

                <div class="comment">
                    <div> <b>기덕</b> 장고 화이팅 </div>
                    <div> <b>재명</b> 알고리즘 화이팅 </div>
                    <div> <b>이성</b> 파이썬 화이팅 </div>
                </div>

                <div class="input-comment">
                    <input id="input-comment" type="text" class="form-control" placeholder="댓글 달기...">
                </div>
            </div>
        </div>

        <div class="right-body">
            <div class="profile">
                <div class="profile-img-box" style="width: 60px; height: 60px;">
                    <img class="profile-img"
                        src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
                </div>
                <div class="profile-text">
                    <div class="profile-id">
                        jollyn
                    </div>
                    <div class="profile-name" style="color: grey;">
                        anneyujeong
                    </div>
                </div>
            </div>

            <div class="recommend-msg">
                <div id="recommend-text">회원님을 위한 추천</div>
                <a id="recommend-plus" "href="#">모두보기</a>
            </div>

            <div class="recommend-lst">
                <div class="profile">
                    <div class="profile-img-box" style="width: 35px; height: 35px;">
                        <img class="profile-img"
                            src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
                    </div>

                    <div class="profile-text">
                        <div class="profile-id">
                            jollyn
                        </div>
                        <div class="profile-name" style="color: grey;">
                            민정님 외 4명이 팔로우합니다
                        </div>
                    </div>
                </div>
                <a id="follow" "href="#">팔로우</a>
            </div>
            <div class="recommend-lst">
                <div class="profile">
                    <div class="profile-img-box" style="width: 35px; height: 35px;">
                        <img class="profile-img"
                            src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
                    </div>

                    <div class="profile-text">
                        <div class="profile-id">
                            jollyn
                        </div>
                        <div class="profile-name" style="color: grey;">
                            민정님 외 4명이 팔로우합니다
                        </div>
                    </div>
                </div>
                <a id="follow" "href="#">팔로우</a>
            </div>
            <div class="recommend-lst">
                <div class="profile">
                    <div class="profile-img-box" style="width: 35px; height: 35px;">
                        <img class="profile-img"
                            src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
                    </div>

                    <div class="profile-text">
                        <div class="profile-id">
                            jollyn
                        </div>
                        <div class="profile-name" style="color: grey;">
                            민정님 외 4명이 팔로우합니다
                        </div>
                    </div>
                </div>
                <a id="follow" "href="#">팔로우</a>
            </div>

            <div class="information">
                소개 도움말 홍보센터 API 채용정보
                <p>개인정보처리방침 약관 위치 인기계정 해시태그 언어</p>

                © 2021 INSTAGRAM FROM META
            </div>
    </div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
