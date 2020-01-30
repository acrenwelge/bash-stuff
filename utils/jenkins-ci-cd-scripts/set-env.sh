# Set some environment variables
# This creates a file that needs to be executed separately
cat > /etc/profile.d/tomcat.sh << 'EOF'
export JAVA_HOME=/usr/lib/jvm/java-1.8.0
export JENKINS_HOME=/var/lib/jenkins
EOF
