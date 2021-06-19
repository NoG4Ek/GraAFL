for /r ".\in" %%f in (*.) do (
	call java -agentlib:native-image-agent=config-merge-dir=META-INF\native-image -jar .\ImageTest.jar %%f
)
pause