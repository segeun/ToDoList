# ToDoList

## 🐶 ToDoList(08.07)


- 전체적인 `view`와 `model`의 틀을 잡았다.
`List`로 `ToDoStore`에 있는 값을 뽑게 만들었고<br/> 
<br/>`toolbar` 통해 Todo를 추가할 수 있게 설정해놨다. 
`DatePicker`를 사용해 날짜와 시간을 선택할 수 있다.<br/> 
<br/>`TextField`와 함께 내가 저장하고 싶은 `ToDoList`를 저장할 수 있다.<br/> <br/>

## 🐱 ToDoList(08.08)

- 일정 `TextField` 입력란에 비어있는 상태로 추가를 선택하면<br/><br/> 
경고 `Alert`이 뜬다. `dateFormatter` 의 용어를 활용해서 더욱 가시성이 좋게 했다.<br/> <br/>

## 🐭 ToDoList(08.17)

- Firebase와 연동 시작, Firestore와 연결해서 데이터를 관리한다.<br/> <br/> 
- 오류 투성이. 분명 똑같이 따라 했는데 프리뷰와 전부 먹통<br/> <br/>

## 🐻‍❄️ ToDoList(08.21)

- 저번주부터 헤매던 Firebase의 Firestore 연동을 성공했다.
- 비교적 간단한(?)문제였다.
- 규칙을 수정하는 것이였는데, DB에 접근하는 허용범위의 `default`의 기본값은 `false`  

### 이 상태로는 앱에서 DB접근이 불가능해서 좋은 방법(?)은 아니지만 `true`로 바꿔줬다 
### -> 성공⭐️
  (추후엔 사용자의 UID와 같은 경우만 허용하게끔 수정이 필요하다)<br/> 

- 또한 `GoogleService-info` 이름이 `GoogleService-info(4)`로 그대로 썼더니 처음보는 오류가 생겼다.<br/> <br/> 

### 이 파일의 이름도 `GoogleService-info` 로 본래 이름으로 바꿨더니 문제 X <br/> <br/>  
- 이 과정을 끝내고 `View` 2개 추가(`TodoCellView`, `TodoDetailView`)
- 가능한 기능 -> 전체적인 UI 수정, 댓글달기, 프로필 사진, 로그인 구현 등등<br/> <br/>  

## 🐵 ToDoList(08.22)
- reply 구조체와 store를 만들었다.(댓글 구현을 위해)
- 우선 댓글 기능을 추가했지만 사용자 이름이 뜨지 않는 오류를 계속 발생시킴
- 또한, 느닷없이 잘 되던 `DatePicker` 날짜 저장이 안 된다. (잘못 건드린듯..)
- 다음에 해결 해야 할 과제: 댓글 사용자 이름 노출, `DatePicker` 정상 적용<br/> <br/>

## 🐦 ToDoList(08.08)

- DatePicker의 데이터 연동과 저장 성공
- Button의 UI 디자인을 살짝 수정했다.
- 다음에 해야 할 것: UI디자인, 댓글 기능<br/> <br/>
  

