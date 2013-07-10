module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    watch: {
      files: ['sass/**/*.sass', 'slim/**/*.slim', 'coffee/**/*.coffee'],
      tasks: ['slim:dev', 'sass:dev', 'coffee:dev'],
      options: {
        livereload: true
      }
    },

    sass: {
      dev: {
        options: {
          style: 'expanded'
        },
        files: [
          {
            expand: true,
            src: ['**/*.sass'],
            cwd: 'sass/',
            dest: 'build/stylesheets/',
            ext: '.css'
          }
        ]
      }
    },

    coffee: {
      dev: {
        files: [
          {
            expand: true,
            src: ['**/*.coffee'],
            cwd: 'coffee/',
            dest: 'build/javascripts/',
            ext: '.js'
          }
        ]
      }
    },

    slim: {
      dev: {
        options: {
          pretty: true
        },
        files: [
          {
            expand: true,
            src: ['**/*.slim'],
            cwd: 'slim/',
            dest: 'build/',
            ext: '.html'
          }
        ]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-slim');

  grunt.registerTask('default', ['slim:dev', 'sass:dev', 'coffee:dev']);
}
