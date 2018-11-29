param($h='8.8.8.8') #Входящий параметр, указываем какой хост пинговать, например: ping.ps1 -h 192.168.1.1
$ping = new-object System.Net.NetworkInformation.Ping
$date = Get-Date -format yyyy-MM-dd
While (1 -ne 0) { #бесконечный цикл
 $reply = $ping.send($h)
 $timestamp = "{0:yyyy-MM-dd HH:mm:ss}" -f (get-date) #отметка времени
 if ($reply.status -eq "Success") { #Если хост пингуется
  $reply_time = $reply.RoundtripTime #время ответа
  "$timestamp $h $reply_time"
 }
 else { #если хост не пингуется
  "$timestamp $h timeout"
 }
 Start-Sleep -s 1 #секундная задержка
}