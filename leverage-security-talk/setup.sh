ISTIO_NS="istio-system"
BOOKINFO_NS="bookinfo"

oc apply -f namespace.yaml

oc adm policy add-scc-to-user privileged -z default -n $BOOKINFO_NS
oc adm policy add-scc-to-user anyuid -z default -n $BOOKINFO_NS

oc adm policy add-scc-to-user privileged -z bookinfo-productpage -n bookinfo
oc adm policy add-scc-to-user anyuid -z bookinfo-productpage -n bookinfo

oc adm policy add-scc-to-user privileged -z bookinfo-reviews -n bookinfo
oc adm policy add-scc-to-user anyuid -z bookinfo-reviews -n bookinfo

oc adm policy add-scc-to-user privileged -z bookinfo-ratings -n bookinfo
oc adm policy add-scc-to-user anyuid -z bookinfo-ratings -n bookinfo

oc adm policy add-scc-to-user privileged -z bookinfo-details -n bookinfo
oc adm policy add-scc-to-user anyuid -z bookinfo-details -n bookinfo
