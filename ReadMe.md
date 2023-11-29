## 2023-2-OS-Assignment 05

> IOzone3를 이용하여 3가지의 Linux I/O scheduler 성능 테스트

1. 레포 클론

```bash
git clone https://github.com/Tolerblanc/2023-2-OS-Assignment05.git && cd 2023-2-OS-Assignment05
```

2. iozone3 설치

```bash
sudo apt-get update && sudo apt-get install iozone3
```

3. 실험 수행 후 분석

```bash
make
```

-   실험 수행 전 `Makefile` 의 `TEST_TYPES` 에 다른 테스트 연산 추가
-   `result` 폴더의 실험 결과를 바탕으로 보고서 작성
