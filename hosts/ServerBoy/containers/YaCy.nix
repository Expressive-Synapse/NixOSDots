{ ... }:

{

virtualisation.oci-containers.containers."YaCy-Service" = {
  image = "yacy/yacy_search_server:latest";
  ports = ["192.168.1.29:8090:8090" "8443:8443"];
};

}
