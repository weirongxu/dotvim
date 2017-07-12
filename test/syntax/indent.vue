<template>
  <div>
    <router-link :to=""></router-link>
    <div
      :class="{test: true}"
      @click="callback"
      ></div>
    <el-form>
      <el-input></el-input>
    </el-form>
    <router-view></router-view>
  </div>
</template>

<style lang="scss">
.css {
  h3 {
    width: 10px;
  }
}
</style>

<style lang="less">
.css {
  h3 {
    width: 10px;
  }
}
</style>

<style scoped>
.css {
  h3 {
    width: 10px;
  }
}
</style>

<script>
import name from 'name'

class Test {
  @readOnly
  static func() {
  }
}
</script>
