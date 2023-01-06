# Check It! (체킷)
<img width="300" alt="CheckItLogo" src="https://user-images.githubusercontent.com/114602459/210921638-7eb149fa-224c-4754-bff9-44514c573262.png">

## ADS 및 페르소나
```markdown
- 동아리에서 출석부를 관리하고 싶은 동아리 장
- 간편한 출석체크와 출석 현황을 확인하고 싶은 동아리원
```

## 주요기능
```
홈 탭 : 사용자는 앱을 통해 가입한 동아리를 한눈에 확인하고 MapKit과 QR코드를 통한 간편 출석을 할 수 있다.
출석부 탭 : 사용자는 앱을 통해 모든 동아리의 출석 현황을 관리할 수 있다.
마이 탭 : 사용자는 앱을 통해 로그인 정보를 확인할 수 있다.
```

## 개발환경
```markdown
- iPhone 14 Pro 에서 최적화됨
- 다크모드 미지원
```

## 사용자 시나리오
<img width="1000" alt="CheckIt_UserFlow" src="https://user-images.githubusercontent.com/114602459/210921459-bc5cc830-c851-4df5-9a86-09f6fec1d294.png">

## 동작 구현 
| ![SignIn](https://user-images.githubusercontent.com/64696968/210963699-99771c86-9ee4-4488-a286-b346a37449a7.gif) | ![LoginFailed](https://user-images.githubusercontent.com/64696968/210965160-7b8980d2-f93a-4a63-ba1b-5d0efbef70e7.gif) | ![LoginSuccees](https://user-images.githubusercontent.com/64696968/210964992-191aad0f-a3a4-4d4e-9401-e654b62573de.gif) |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |
| 📎 회원가입 | 📎 로그인 실패 | 📎 로그인 성공 |

| ![groupList](https://user-images.githubusercontent.com/64696968/210965961-5ae144ac-fadf-4558-a923-3a60c5a5b528.gif) | ![joinGroup](https://user-images.githubusercontent.com/64696968/210966029-bd7de097-c0ed-445e-a685-3c08c2079d94.gif) | ![groupCreate](https://user-images.githubusercontent.com/64696968/210966097-e29c65bf-0745-4767-b360-8402ae72e2d3.gif) |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |
| 📎 모임 목록 보기 | 📎 초대코드로 모임 참여 | 📎 모임 개설하기 |

| ![CheckitGroupwithMapKit](https://user-images.githubusercontent.com/64696968/210966495-59ca88ca-288a-4c30-bdb1-5aceb6d1cab1.gif) | ![CheckitGroupWithQRCode](https://user-images.githubusercontent.com/64696968/210966418-fe3a2d44-b269-4ee4-852f-c151bf7e9988.gif) |
| :----------------------------------------------------------: | :---------------------------------------------: |
| 📎 MapKit으로 Check-It! | 📎 QR코드로 Check-It! |

| ![codeShare](https://user-images.githubusercontent.com/64696968/210967156-6bdbf2d6-94cc-4950-ade3-ab8bd974a00b.gif) | ![MyGroupList](https://user-images.githubusercontent.com/64696968/210967217-2c0cfb15-d09f-4f27-a4b4-3e8013921190.gif) | ![MyPageView](https://user-images.githubusercontent.com/64696968/210967275-1e926319-6d31-4689-bbb1-ba9d83e69b83.gif) |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |
| 📎 초대코드 공유하기 | 📎 내가 참가 중인 모임들 출석부 모아보기 | 📎 마이페이지 |


## 데이터 구조 
```
📂 Model
📂 View
📂 ViewModel
```

## Git 커밋 컨벤션

```markdown
- [Feat] 새 기능 추가
- [Fix] 버그 수정, 오류 해결
- [Docs] 문서 수정
- [Style] 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
- [Refactor] 코드 리팩토링
- [Test] 테스트 코드, 리펙토링 테스트 코드 추가
- [Chore] 빌드 업무 수정, 패키지 매니저 수정
```

## Git 브랜치 컨벤션

```markdown
- 작업은 `dev` 브랜치에서 `새로운 브랜치를 생성`하여 작업
- 브랜치 이름은 상위브랜치_현재작업중인폴더또는뷰_이름 
ex) `dev_LoginSignUp_HanHo`
```

## 참여자
| 📎허혜민 [제안자]<br/>[@soletree](https://github.com/soletree)<br/> | 📎최한호<br/> [@guguhanogu](https://github.com/guguhanogu)<br/> | 📎황예리<br/>[@hwangyeri](https://github.com/hwangyeri)<br/> | 📎류창휘<br/> [@ryuchanghwi](https://github.com/ryuchanghwi)<br/> |
| :----------------------------------------------------------: | :---------------------------------------------: | :-------------------------------------------------: |:----------------------------------------------------------: |
|<img src="https://avatars.githubusercontent.com/u/97100404?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/64696968?v=4" width=200>  | <img src="https://avatars.githubusercontent.com/u/114602459?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/78063938?v=4" width=200> |

| 📎차소민<br/> [@chasomin](https://github.com/chasomin)<br/> |  📎이학진<br/> [@LEEHAKJIN-VV](https://github.com/LEEHAKJIN-VV)<br/> | 📎김응관<br/> [@alpha-kwhn](https://github.com/alpha-kwhn)<br/> | 📎조현호<br/> [@HHCHO0220](https://github.com/HHCHO0220)<br/> |
| :---------------------------------------------: | :-------------------------------------------------: | :----------------------------------------------------------: | :---------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/114223423?v=4" width=200>  | <img src="https://avatars.githubusercontent.com/u/52197436?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/40496065?v=4" width=200> | <img src="https://avatars.githubusercontent.com/u/109830398?v=4" width=200> |
