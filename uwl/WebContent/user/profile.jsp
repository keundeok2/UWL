<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>어울림</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/profile.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
    <script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
    <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <script src="/javascript/profile.js"></script>
</head>

<body>

	<input type="hidden" id="sessionUserId" value="${user.userId}">
	<input type="hidden" id="targetUserId" value="${targetUserId}">







    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>









    <div class="wrap">
        <div class="profileHeader">
            <div class="profileImage">
                <a href="#">
                    <c:if test="${empty user.profileName}">

                        <img src="/images/bonobono.jpg" alt="">
                    </c:if>
                    <c:if test="${!empty user.profileName}">
                        <img src="/images/${user.profileName}" width="100px" alt="">
                    </c:if>

                </a>
            </div>
            <div class="profile">
                <div class="userId">
                    <div class="user">${targetUser.userId}</div>
                    <%-- ${checkFriend1.friendStatus} ${checkFriend2.friendStatus} --%>
                    <c:if test="${user.userId eq targetUserId }">
                        <div class="profileUpdate"><a href="#">프로필 편집</a></div>
                        <div class="setting"><a href="#"><i class="fas fa-cog"></i></a></div>
                    </c:if>
                    <c:if test="${user.userId ne targetUserId }">
                        <c:if test="${checkFriend1.friendStatus == 2 }">
                            <!-- 친구끊기/친구신청취소, 친구신청(수락) div 추가했음 -->
                            <div class="deleteFriend"><a href="#">친구끊기</a></div>
                        </c:if>
                        <c:if test="${checkFriend1.friendStatus == 1 }">
                            <div class="deleteFriend"><a href="#">친구신청취소</a></div>
                        </c:if>
                        <c:if test="${checkFriend2.friendStatus == 1 }">
                            <div class="acceptFriend"><a href="#">친구신청</a></div>
                        </c:if>
                        <c:if test="${empty checkFriend1.friendStatus and empty checkFriend2.friendStatus}">
                            <div class="addFriend"><a href="#">친구신청</a></div>
                        </c:if>

                        <!--////////////////// 매칭여부 / 꽃보냈는지 여부 추가바람/////////////////////////// -->
                        <c:if test="${checkFriend1.friendStatus == 2 }">








                            <!-- <div class="sendFlower"><a href="#">꽃보내기</a></div> -->



                            <c:if test="${matching.secondUserId ne targetUserId}">

                                <div class="sendFlower"><a href="#" class="addMatching" data-toggle="modal" data-target="#exampleModal">
                                        꽃보내기
                                    </a></div>
                            </c:if>

                            <c:if test="${matching.secondUserId eq targetUserId}">
                                <div class="sendFlower"><a href="#" class="deleteMatching" data-toggle="modal" data-target="#exampleModal">
                                        꽃보내기취소
                                    </a></div>
                            </c:if>





                            <div class="useSpear"><a href="#" data-toggle="modal" data-target="#exampleModal">찔러보기</a></div>
                        </c:if>
                    </c:if>
                </div>
                <div class="post">
                    <div class="totalFlower">
                        <!-- /////////////// totalFlower 추가바람/////////////// -->
                        <img src="/images/love-and-romance.png" width="30px" alt=""> <span>${totalMatching }</span>
                    </div>
                    <!-- /////////////// 활동점수, 포인트 추가바람/////////////// -->
                    <div class="activityPoint"> 활동점수 <span>170</span>
                    </div>
                    <c:if test="${targetUserId eq user.userId }">
                        <!-- point div 추가했음 -->
                        <div class="point"> 포인트 <span>170</span>
                        </div>

                        <div class="totalItem">
                            <img src="/images/spear.png" width="30px" alt=""> <span>${totalSpear }</span>
                        </div>
                        <div class="totalItem2">
                            <img src="/images/shield.png" width="30px" alt=""> <span>${totalShield }</span>
                        </div>
                    </c:if>
                </div>
                <div class="name">
                    <div class="userName">
                        ${targetUser.name}
                    </div>
                    <div class="introduction">
                        ${targetUser.selfIntroduction }<br>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="innerSection">
                <ul>
                    <li class="on"><a href="#"><i class="fas fa-th"></i> 타임라인</a></li>
                    <li><a href="#"><i class="fas fa-tv"></i> ASK</a></li>
                    <li><a href="#"><i class="far fa-bookmark"></i> 커플타임라인</a></li>
                    <li><a href="#"><i class="fas fa-user-tag"></i> 커플캘린더</a></li>
                </ul>
            </div>
            <section>
                <div class="list1 on">
                    게시물ㅋㅋ
                </div>
                <div class="list2">
                    IGTVㅋㅋ
                </div>
                <div class="list3">
                    저장됨ㅋㅋ
                </div>
                <div class="list4">
                    태그됨ㅋㅋ
                </div>
            </section>
        </div>
    </div>
</body></html>