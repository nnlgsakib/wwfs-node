@echo off
setlocal

REM ==========================================
REM Force Go build for Windows 64-bit
REM ==========================================
set GOOS=windows
set GOARCH=amd64
set CGO_ENABLED=0

REM Delete old binary if exists
if exist bin\wwfs.exe del /f /q bin\wwfs.exe

REM Ensure modules are up to date
go mod tidy

REM Get short commit hash (optional)
for /f %%i in ('git rev-parse --short HEAD') do set GIT_COMMIT=%%i

echo Building wwfs-node for Windows amd64...
go build -trimpath ^
  -ldflags="-X github.com/ipfs/kubo.CurrentCommit=%GIT_COMMIT% -X github.com/nnlgsakib/wwfs-node.CurrentCommit=%GIT_COMMIT%" ^
  -o bin\wwfs.exe github.com/nnlgsakib/wwfs-node/cmd/node

if %ERRORLEVEL% neq 0 (
    echo Build FAILED!
    exit /b %ERRORLEVEL%
) else (
    echo Build SUCCESSFUL! Output: bin\wwfs.exe
)

REM Show file info (quick check)
echo.
echo ===== FILE INFO =====
for %%F in (bin\wwfs.exe) do (
    echo Name: %%~nxF
    echo Size: %%~zF bytes
)

endlocal
pause
