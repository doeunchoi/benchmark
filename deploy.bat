@echo off
cd /d "%~dp0"

git add docs/tving_benchmark.html
git diff --cached --quiet && (
  echo [알림] 변경 사항이 없습니다. 파일을 docs 폴더에 저장했는지 확인해 주세요.
  pause
  exit /b
)

for /f "tokens=1-3 delims=/-" %%a in ("%date%") do set YYYYMM=%%a%%b
git commit -m "벤치마크 업데이트 %YYYYMM%"
git push

echo.
echo [완료] GitHub Pages가 1~2분 후 업데이트됩니다.
echo https://doeunchoi.github.io/benchmark/tving_benchmark.html
echo.
pause
