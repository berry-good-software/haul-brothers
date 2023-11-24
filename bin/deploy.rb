require "net/sftp"

printf("Connecting to: %s@%s ...\n",ENV["SFTP_USERNAME"], ENV["SFTP_HOST"])

src_directory = "./_site/"

Net::SFTP.start(ENV["SFTP_HOST"], ENV["SFTP_USERNAME"], :password => ENV["SFTP_PASSWORD"]) do |sftp|
  printf("Making directory: %s...\n", ENV["SFTP_ROOT"])

  directory_exists = sftp.lstat!(ENV["SFTP_ROOT"]).directory?

  if directory_exists
    backup_directory = "#{ENV["SFTP_ROOT"]}-#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}"
    # Remove the directory if it already exists and re-create it
    sftp.rename(ENV["SFTP_ROOT"], backup_directory)
    sftp.mkdir!(ENV["SFTP_ROOT"], :permissions => 0755)
  else
    sftp.mkdir!(ENV["SFTP_ROOT"], :permissions => 0755)
  end

  printf("Uploading directory: %s to %s...\n", src_directory, ENV["SFTP_ROOT"])

  # upload a file or directory to the remote host
  sftp.upload!("./_site/", ENV["SFTP_ROOT"])
end
