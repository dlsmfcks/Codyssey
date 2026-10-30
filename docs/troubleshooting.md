# 개발 워크스테이션 구축 중 발생한 문제와 해결 과정

## 1. Linux 파일 실행 권한 오류

**문제 상황**

WSL Ubuntu에서 `run.sh` 파일을 생성한 후 실행했으나 `Permission denied` 오류가 발생하였다.

```bash
chmod 644 run.sh
./run.sh
```

실행 결과:

```text
bash: ./run.sh: Permission denied
```

**원인 가설 및 확인**

파일의 실행 권한이 설정되지 않았기 때문이라고 판단하였다. `ls -l run.sh` 명령어로 권한을 확인한 결과 `-rw-r--r--`로 나타났으며, 실행 권한인 `x`가 없는 상태였다.

**해결 방법**

```bash
chmod 755 run.sh
./run.sh
```

실행 결과:

```text
Permission test success
```

파일 권한을 755로 변경한 후 정상적으로 실행되었다. 이를 통해 Linux에서 파일의 실행 권한이 프로그램 실행에 미치는 영향을 확인하였다.

## 2. GitHub Push 인증 오류

**문제 상황**

Codyssey 프로젝트를 GitHub 원격 저장소에 업로드하는 과정에서 403 오류가 발생하였다.

```text
Permission to dlsmfcks/Codyssey.git denied to cnu202502195.
The requested URL returned error: 403
```

**원인 가설 및 확인**

기존 학교 과제에서 사용하던 계정으로 GitHub 인증이 이루어지고 있었다. 해당 계정에는 `dlsmfcks/Codyssey` 저장소에 코드를 업로드할 권한이 없었다.

**해결 방법**

학교 과제 계정의 인증 정보를 유지하면서 현재 프로젝트에서 저장소 경로별 인증 정보를 구분하도록 설정하였다.

```bash
git config --local credential.useHttpPath true
git remote set-url origin https://dlsmfcks@github.com/dlsmfcks/Codyssey.git
git push -u origin main
```

올바른 계정으로 인증한 후 다음 결과를 확인하였다.

```text
main -> main
branch 'main' set up to track 'origin/main'.
```

이를 통해 Git 커밋과 원격 저장소 업로드는 별개의 과정이며, GitHub 저장소에 코드를 업로드하려면 인증과 쓰기 권한이 필요하다는 것을 확인하였다.