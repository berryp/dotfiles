require 'fileutils'

dotfiles = [
  'bashrc',
  'bash_profile',
  'bash_aliases',
  'profile',
  'inputrc',
  'gitconfig',
  'gitignore_global',
  'hgrc',
  'hgignore_global',
  'gemrc',
  'vimrc',
  'gvimrc',
]

osx_defaults_commands = [
  # Disable Dashboard.
  'defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock',
  # Expand save panel by default.
  'defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true',
  # Save to disk (not to iCloud) by default.
  'defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false',
  # Automatically quit printer app once the print jobs complete.
  'defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true',
]

backup_dir = "#{ENV['PWD']}/backup"

# This is mostly a one time task that is used to populate the dotfiles
# for this repository.
task :init do
  dotfiles.each do |df|
    src = "#{ENV['HOME']}/.#{df}"
    dest = "#{ENV['PWD']}/#{df}"
    FileUtils::Verbose.cp(src, dest) unless File.symlink? src
  end
end

# Removes all dotfiles (or symlinks) from the home dir.
task :clean do
  dotfiles.each do |df|
    src = "#{ENV['HOME']}/.#{df}"
    FileUtils::Verbose.rm(src)
  end
end

# Takes backups of the dotfiles in the home dir.
task :backup do
  FileUtils.mkdir_p(backup_dir)
  dotfiles.each do |df|
    src = "#{ENV['HOME']}/.#{df}"
    dest = "#{backup_dir}/#{df}"
    FileUtils::Verbose.cp(src, dest) if File.exists? src
  end
end

# Install the dotfiles.
task :install do
  Rake::Task[:backup].clear
  dotfiles.each do |df|
    target = "#{ENV['PWD']}/#{df}"
    dest = "#{ENV['HOME']}/.#{df}"
    FileUtils::Verbose.rm(dest, :force => true) if File.exists? dest
    FileUtils::Verbose.ln_s(target, dest)
  end
end

# Write OS X defaults.
task :osx_defaults do
  osx_defaults_commands.each do |default|
    puts(default); system(default)
  end
  puts
  puts '* OS X defaults preference pane http://www.bresink.com/osx/TinkerTool.html'
end

task :osx => [:osx_defaults]
task :default => [:backup, :install]

