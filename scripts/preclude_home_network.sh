#! /bin/bash
FILE_TO_CHANGE="/config/wg0.conf"
# watch those wrist rockets

if [[ $DROPPED_NETWORKS ]]
then
  if grep -Fq "$DROPPED_NETWORKS" $FILE_TO_CHANGE
  then
      echo "no networks to add to dropped networks"
  else
      sed '/PostUp/d' $FILE_TO_CHANGE
      sed '/PostDown/d' $FILE_TO_CHANGE
      sed -i '5i\
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -I FORWARD -i %i -d DROPPED_NETWORKS -j DROP; iptables -A FORWARD -o %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE\
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD -i %i -d DROPPED_NETWORKS -j DROP; iptables -D FORWARD -o %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE\
# drop local network requests
' $FILE_TO_CHANGE

      sed -i "s@DROPPED_NETWORKS@$DROPPED_NETWORKS@g" $FILE_TO_CHANGE
  fi
fi
exit 0