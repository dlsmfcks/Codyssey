# Linux 파일 및 디렉터리 권한 실습

## 1. 실습 목적

WSL Ubuntu 환경에서 파일과 디렉터리의 권한을 확인하고, `chmod` 명령어를 이용해 접근 권한을 변경하는 과정을 실습하였다.

## 2. 파일 실행 권한 확인

실행 테스트를 위한 `run.sh` 파일을 생성하고 권한을 644로 설정하였다.

```bash
chmod 644 run.sh
ls -l run.sh
./run.sh
```

실행 결과:

```text
-rw-r--r-- 1 coris0907 coris0907 43 Oct 30 18:51 run.sh
bash: ./run.sh: Permission denied
```

644 권한에서는 실행 권한이 없어 스크립트를 직접 실행할 수 없었다.

이후 권한을 755로 변경하였다.

```bash
chmod 755 run.sh
ls -l run.sh
./run.sh
```

실행 결과:

```text
-rwxr-xr-x 1 coris0907 coris0907 43 Oct 30 18:51 run.sh
Permission test success
```

실행 권한을 부여한 후 스크립트가 정상적으로 실행되는 것을 확인하였다.

## 3. 디렉터리 권한 변경

`test-directory`를 생성하고 권한을 755에서 700으로 변경하였다.

```bash
chmod 755 test-directory
ls -ld test-directory

chmod 700 test-directory
ls -ld test-directory
```

실행 결과:

```text
drwxr-xr-x 2 coris0907 coris0907 4096 Oct 30 18:52 test-directory
drwx------ 2 coris0907 coris0907 4096 Oct 30 18:52 test-directory
```

755에서는 소유자 이외의 사용자도 디렉터리에 접근할 수 있지만, 700에서는 소유자에게만 읽기, 쓰기, 실행 권한이 부여된다.

## 4. 실습 결과

이번 실습을 통해 Linux의 파일 권한이 읽기(r), 쓰기(w), 실행(x)으로 구성된다는 것을 확인하였다. 특히 파일의 실행 권한 유무에 따라 스크립트 실행 결과가 달라지는 것을 직접 확인할 수 있었다.