# Calculator

> 프로그램 구현하기 전 혹은 구현 중 고려한 사항은 [다음 문서](docs/consideration.md)에 정리해두었음.

## TL;DR

계산할 연산을 문자열로 넘기면 이를 계산하는 CLI 프로그램.

예시
> 다음 예시는 현재 예상하고 있는 CLI interface.

```bash
calculator "1 + 2"
```

결과

```plaintext
3
```

## 지원 연산

- [x] 덧셈
- [x] 뺄셈
- [x] 곱셈
- [x] 나눗셈
- [ ] 삼각 함수
