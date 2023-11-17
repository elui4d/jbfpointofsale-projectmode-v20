<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:exsl4D="http://www.4D.com"
                xmlns:math="http://exslt.org/math"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                >
  <xsl:import href="graph_common.xsl" />

  <xsl:output method="xml" encoding="UTF-8" indent="yes" media-type="image/svg"/>

  <!-- top-level parameters -->

  <!-- viewport properties -->
  <xsl:param name="viewport_color" select="'white'" />
  <xsl:param name="viewport_opacity" select="0.0" />
  <xsl:param name="viewport_height" select="500" />
  <xsl:param name="viewport_width" select="0" />

  <!-- shape properties -->
  <xsl:param name="shape_rendering" select="'crispEdges'" />

  <!-- font properties -->
  <xsl:param name="font_color" select="'black'" />
  <xsl:param name="font_family" select="'Arial'" />
  <xsl:param name="font_size" select="12" />
  <xsl:param name="font_width" select="$font_size div 2" />
  <xsl:param name="font_descent" select="$font_size div 10" />
  <xsl:param name="font_weight" select="'normal'" />
  <xsl:param name="font_style" select="'normal'" />
  <xsl:param name="font_decoration" select="'none'" />
  <xsl:param name="font_filter" select="'none'" />

  <!-- label format properties -->
  <xsl:param name="label_format_number" select="'############0.###'" />
  <xsl:param name="label_format_date"   select="'1'" />
  <xsl:param name="label_format_time"   select="'1'" />

  <xsl:param name="x_label_format_number" select="$label_format_number" />
  <xsl:param name="x_label_format_date"   select="$label_format_date" />
  <xsl:param name="x_label_format_time"   select="$label_format_time" />

  <xsl:param name="y_label_format_number" select="$label_format_number" />
  <xsl:param name="y_label_format_date"   select="$label_format_date" />
  <xsl:param name="y_label_format_time"   select="$label_format_time" />

  <!-- layout properties -->
  <xsl:param name="base_margin" select="10" />

  <!-- title properties -->
  <xsl:param name="title_color"             select="$font_color" />
  <xsl:param name="title_font_family"       select="$font_family" />
  <xsl:param name="title_font_size"         select="20" />
  <xsl:param name="title_font_width"        select="$title_font_size div 2" />
  <xsl:param name="title_font_descent"      select="$title_font_size div 10" />
  <xsl:param name="title_font_weight"       select="'bold'" />
  <xsl:param name="title_font_style"        select="$font_style" />
  <xsl:param name="title_font_decoration"   select="$font_decoration" />
  <xsl:param name="title_font_filter"       select="$font_filter" />

  <xsl:param name="title_margin"            select="$base_margin" />

  <xsl:param name="title_border_visible"      select="1" />
  <xsl:param name="title_border_margin"       select="4" />
  <xsl:param name="title_border_fill_color"   select="'white'" />
  <xsl:param name="title_border_fill_opacity" select="0.6" />
  <xsl:param name="title_border_stroke_color" select="'lightgray'" />
  <xsl:param name="title_border_stroke_width" select="1" />

  <xsl:param name="title" select="''" />

  <!-- legend properties -->
  <xsl:param name="legend_color"            select="$font_color" />
  <xsl:param name="legend_font_family"      select="$font_family" />
  <xsl:param name="legend_font_size"        select="12" />
  <xsl:param name="legend_font_width"       select="$legend_font_size div 2" />
  <xsl:param name="legend_font_descent"     select="$legend_font_size div 10" />
  <xsl:param name="legend_font_weight"      select="$font_weight" />
  <xsl:param name="legend_font_style"       select="$font_style" />
  <xsl:param name="legend_font_decoration"  select="$font_decoration" />
  <xsl:param name="legend_font_filter"      select="$font_filter" />

  <xsl:param name="legend_bullet_size"      select="20" />
  <xsl:param name="legend_bullet_filter"    select="'none'"/>
  <xsl:param name="legend_bullet_name"      select="'ID_legend_'"/>
  <xsl:param name="legend_bullet_stroke_color" select="'none'"/>

  <xsl:param name="legend_rect_fill_color"   select="'rgb(229,229,229)'" />
  <xsl:param name="legend_rect_fill_opacity" select="1" />
  <xsl:param name="legend_rect_stroke_color" select="'gray'" />
  <xsl:param name="legend_rect_stroke_width" select="0" />
  <xsl:param name="legend_rect_filter"       select="'none'"/>
  <xsl:param name="legend_visibility"        select="'visible'"/>
  <xsl:param name="legend_rx"                select="10"/>
  <xsl:param name="legend_ry"                select="10"/>

  <!-- x label properties -->
  <xsl:param name="x_label_color"            select="$font_color" />
  <xsl:param name="x_label_font_family"      select="$font_family" />
  <xsl:param name="x_label_font_size"        select="$font_size" />
  <xsl:param name="x_label_font_width"       select="$x_label_font_size div 2" />
  <xsl:param name="x_label_font_descent"     select="$x_label_font_size div 10" />
  <xsl:param name="x_label_font_weight"      select="$font_weight" />
  <xsl:param name="x_label_font_style"       select="$font_style" />
  <xsl:param name="x_label_font_decoration"  select="$font_decoration" />
  <xsl:param name="x_label_font_filter"      select="$font_filter" />

  <xsl:param name="x_label_border_visible"      select="0" />
  <xsl:param name="x_label_border_margin"       select="2" />
  <xsl:param name="x_label_border_fill_color"   select="'white'" />
  <xsl:param name="x_label_border_fill_opacity" select="0.6" />
  <xsl:param name="x_label_border_stroke_color" select="'lightgray'" />
  <xsl:param name="x_label_border_stroke_width" select="1" />
  <xsl:param name="x_label_visibility"          select="'visible'" />

  <!-- y label properties -->
  <xsl:param name="y_label_color"            select="$font_color" />
  <xsl:param name="y_label_font_family"      select="$font_family" />
  <xsl:param name="y_label_font_size"        select="$font_size" />
  <xsl:param name="y_label_font_width"       select="$y_label_font_size div 2" />
  <xsl:param name="y_label_font_descent"     select="$y_label_font_size div 10" />
  <xsl:param name="y_label_font_weight"      select="$font_weight" />
  <xsl:param name="y_label_font_style"       select="$font_style" />
  <xsl:param name="y_label_font_decoration"  select="$font_decoration" />
  <xsl:param name="y_label_font_filter"      select="$font_filter" />

  <xsl:param name="y_label_border_visible"      select="0" />
  <xsl:param name="y_label_border_margin"       select="2" />
  <xsl:param name="y_label_border_fill_color"   select="'white'" />
  <xsl:param name="y_label_border_fill_opacity" select="0.6" />
  <xsl:param name="y_label_border_stroke_color" select="'lightgray'" />
  <xsl:param name="y_label_border_stroke_width" select="1" />
  <xsl:param name="y_label_visibility"          select="'visible'" />

  <!-- background properties (CD) -->
  <xsl:param name="background_visible" select="1"/>
  <xsl:param name="background_color1" select="'rgb(229,229,229)'"/>

  <!-- axis properties -->
  <xsl:param name="axis_color" select="'black'" />
  <xsl:param name="axis_y0_color" select="'rgb(100,100,100)'" />
  <xsl:param name="axis_width" select="1" />
  <xsl:param name="axis_visibility" select="'visible'" />

  <!-- grid properties -->
  <xsl:param name="x_grid_color" select="'#ffffff'" />
  <xsl:param name="x_grid_color_shadow" select="'#a8a8a8'" />
  <xsl:param name="x_grid_width" select="1" />

  <xsl:param name="y_grid_color" select="'#ffffff'" />
  <xsl:param name="y_grid_color_shadow" select="'#a8a8a8'" />
  <xsl:param name="y_grid_width" select="1" />

  <!-- column bars properties -->
  <xsl:param name="bar_size" select="100"/>
  <xsl:param name="bar_size_min" select="8"/>
  <xsl:param name="bar_r" select="10"/>
  <xsl:param name="bar_filter" select="'none'"/>
  <xsl:param name="bar_fill_opacity" select="'1'"/>
  <xsl:param name="bar_stroke" select="'black'"/>
  <xsl:param name="bar_stroke_opacity" select="'0'"/>
  <xsl:param name="bar_stroke_width" select="'0'"/>
  <xsl:param name="bar_shadow_color" select="'black'"/>
  <xsl:param name="bar_shadow_opacity" select="0.2"/>
  <xsl:param name="bar_shadow_shift_x" select="3"/>
  <xsl:param name="bar_shadow_shift_y" select="0"/>

  <!-- match root element -->
  <xsl:template match="graph">
    <!-- global constants-->

    <!-- legend properties -->
    <xsl:variable name="legend_max_car" select="exsl4D:max-string-length(legend/v)+2"/>

    <xsl:variable name="legend_label_width" select="$legend_max_car*$legend_font_width"/>
    <xsl:variable name="legend_box_width" select="number(boolean(legend/v[1]))*($base_margin+$legend_bullet_size+$base_margin+$legend_label_width+$base_margin)"/>
    <xsl:variable name="legend_box_height" select="$base_margin+(($legend_bullet_size+$base_margin)*count(legend/v))"/>

    <!-- axis x labels properties -->
    <xsl:variable name="x_values_count" select="count(x_values/v)"/>
    <xsl:variable name="x_label_max_car" select="exsl4D:max-value-length(x_values/v,$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>
    <xsl:variable name="x_label_width" select="$x_label_font_width*$x_label_max_car"/>

    <!-- axis y labels properties -->
    <xsl:variable name="y_label_max_car" select="exsl4D:max-value-length(y_grid_values/v,$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>
    <xsl:variable name="y_label_width" select="$y_label_font_width*$y_label_max_car"/>
    <xsl:variable name="y_label_count" select="count(y_grid_values/v)" />

    <xsl:variable name="y_values_count" select="count(y_values)" />

    <!-- graph margins -->
    <xsl:variable name="graph_left_margin" select="$y_label_width+($base_margin*2)" />
    <xsl:variable name="graph_right_margin" select="(($legend_box_width+$base_margin)*number(boolean(legend/v)))+$base_margin"/>
    <xsl:variable name="graph_top_margin" select="(number(boolean($title))*($title_font_size+$title_margin))+$y_label_font_size+$base_margin" />
    <xsl:variable name="graph_bottom_margin" select="$x_label_font_size+($base_margin*2)" />

    <!-- graph bars properties -->
    <xsl:variable name="bar_prop" select="number($viewport_width &gt; 0)" />
    <xsl:variable name="data_group_width_min" select="exsl4D:max($x_label_width+$base_margin,($base_margin*4)+($bar_size_min))"/>
    <xsl:variable name="temp_width" select="exsl4D:max($viewport_width,(($data_group_width_min*$x_values_count)+$graph_left_margin+$graph_right_margin))" />
    <xsl:variable name="bar_width" select="($bar_size*(1 - $bar_prop))+((((($temp_width - $graph_left_margin - $graph_right_margin) div $x_values_count) - ($base_margin*4)))*$bar_prop)" />

    <xsl:variable name="bar_group_width" select="$bar_width"/>
    <xsl:variable name="data_group_width_base" select="($base_margin*4)+$bar_group_width"/>
    <xsl:variable name="data_group_width" select="exsl4D:max($data_group_width_base,$data_group_width_min)"/>
    <xsl:variable name="bar_group_offset" select="($data_group_width - $bar_group_width) div 2"/>

    <!-- viewbox properties -->
    <xsl:variable name="viewbox_width" select="($data_group_width*$x_values_count)+$graph_left_margin+$graph_right_margin" />
    <xsl:variable name="viewbox_height" select="exsl4D:max($viewport_height,$graph_top_margin+$legend_box_height+$graph_bottom_margin)" />

    <xsl:variable name="legend_box_x" select="$viewbox_width - $graph_right_margin + $base_margin"/>
    <xsl:variable name="legend_box_y" select="$graph_top_margin"/>
    <xsl:variable name="legend_bullet_x" select="$legend_box_x + $base_margin"/>
    <xsl:variable name="legend_bullet_y" select="$legend_box_y + $base_margin"/>
    <xsl:variable name="legend_label_x" select="$legend_bullet_x + $legend_bullet_size + $base_margin"/>
    <xsl:variable name="legend_label_y" select="$legend_bullet_y + $legend_bullet_size - (($legend_bullet_size - $legend_font_size) div 2) - $legend_font_descent"/>
    <xsl:variable name="legend_step_y" select="$legend_bullet_size+$base_margin"/>

    <!-- title properties -->
    <xsl:variable name="title_max_car" select="string-length($title)"/>
    <xsl:variable name="title_label_width" select="$title_max_car*$title_font_width"/>
    <xsl:variable name="title_pos_y" select="$base_margin+$title_font_size" />
    <xsl:variable name="title_pos_x" select="$graph_left_margin + (($viewbox_width - $graph_left_margin - $graph_right_margin) div 2)"/>

    <xsl:variable name="y_max" select="number(settings/y_max)"/>
    <xsl:variable name="y_min" select="number(settings/y_min)"/>
    <xsl:variable name="y_scale" select="($viewbox_height - $graph_top_margin - $graph_bottom_margin) div exsl4D:max(0.000000000001,$y_max - $y_min)"/>

    <!-- create svg root element-->
    <svg id="ID_svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 {$viewbox_width} {$viewbox_height}" viewport-fill="{$viewport_color}" viewport-fill-opacity="{$viewport_opacity}">
      <xsl:variable name="y0" select="$viewbox_height - $graph_bottom_margin + ($y_min*$y_scale)" />

      <xsl:comment>gradient styles</xsl:comment>
      <defs >

        <xsl:call-template name="filter_defs">
          <xsl:with-param name="shadow_deviation" select="$filter_shadow_deviation"/>
        </xsl:call-template>
      </defs>

      <xsl:comment>global stroke and font styles</xsl:comment>
      <g id="ID_globals" style="fill:{$font_color};stroke:none;font-family:{$font_family};font-size:{$font_size}px;font-weight:{$font_weight};font-style:{$font_style};text-decoration:{$font_decoration};shape-rendering:{$shape_rendering}">

        <xsl:comment>draw title</xsl:comment>
        <xsl:if test="$title_max_car &gt; 0">
          <g id="ID_title" style="fill:{$title_color};stroke:none;font-family:{$title_font_family};font-size:{$title_font_size}px;font-weight:{$title_font_weight};font-style:{$title_font_style};text-decoration:{$title_font_decoration};filter:{$title_font_filter}" >
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$title_pos_x" />
              <xsl:with-param name="y"                      select="$title_pos_y" />
              <xsl:with-param name="text"                   select="$title"/>

              <xsl:with-param name="font_size"              select="$title_font_size"/>
              <xsl:with-param name="font_descent"           select="$title_font_descent"/>

              <xsl:with-param name="border_visible"         select="$title_border_visible" />
              <xsl:with-param name="border_margin"          select="$title_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$title_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$title_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$title_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$title_border_stroke_width" />
            </xsl:call-template>
          </g>
        </xsl:if>

        <xsl:comment>draw legend</xsl:comment>
        <xsl:if test="legend/v" >
          <g id="ID_legend" filter="{$legend_rect_filter}" visibility = "{$legend_visibility}">
            <xsl:comment>draw legend border</xsl:comment>
            <xsl:call-template name="legend_border">
              <xsl:with-param name="x" select="$legend_box_x" />
              <xsl:with-param name="y" select="$legend_box_y" />
              <xsl:with-param name="rx" select="$legend_rx" />
              <xsl:with-param name="ry" select="$legend_ry" />
              <xsl:with-param name="width" select="$legend_box_width" />
              <xsl:with-param name="height" select="$legend_box_height" />
              <xsl:with-param name="fill-color" select="$legend_rect_fill_color" />
              <xsl:with-param name="fill-opacity" select="$legend_rect_fill_opacity" />
              <xsl:with-param name="stroke-color" select="$legend_rect_stroke_color" />
              <xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
            </xsl:call-template>


            <xsl:comment>draw legend bullets</xsl:comment>
            <g id="ID_legend_bullets" stroke="{$legend_bullet_stroke_color}">
              <xsl:for-each select="legend/v">

                <!-- local variables-->
                <xsl:variable name="y_values_index" select="position()"/>

                <!-- get data type color -->
                <xsl:variable name="fill_color">
                  <xsl:choose>
                    <xsl:when test="$y_values_index = 1">
                      <xsl:value-of select="$default_color1"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 2">
                      <xsl:value-of select="$default_color2"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 3">
                      <xsl:value-of select="$default_color3"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 4">
                      <xsl:value-of select="$default_color4"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 5">
                      <xsl:value-of select="$default_color5"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 6">
                      <xsl:value-of select="$default_color6"/>
                    </xsl:when>
                    <xsl:when test="$y_values_index = 7">
                      <xsl:value-of select="$default_color7"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$default_color8"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>

                <xsl:call-template name="legend_bullet">
                  <xsl:with-param name="x" select="$legend_bullet_x" />
                  <xsl:with-param name="y" select="$legend_bullet_y+$legend_step_y*(position()-1)" />
                  <xsl:with-param name="width" select="$legend_bullet_size" />
                  <xsl:with-param name="height" select="$legend_bullet_size" />
                  <xsl:with-param name="fill" select="$fill_color" />
                  <xsl:with-param name="filter" select="$legend_bullet_filter" />
                  <xsl:with-param name="id" select="concat($legend_bullet_name,string(position()))" />
                  <xsl:with-param name="stroke" select="$legend_bullet_stroke_color" />
                  <xsl:with-param name="stroke-width" select="$legend_rect_stroke_width" />
                </xsl:call-template>
              </xsl:for-each>

            </g>
            <xsl:comment>draw legend labels</xsl:comment>
            <g id="ID_legend_labels" style="fill:{$legend_color};stroke:none;font-family:{$legend_font_family};font-size:{$legend_font_size}px;font-weight:{$legend_font_weight};font-style:{$legend_font_style};text-decoration:{$legend_font_decoration};filter:{$legend_font_filter};text-anchor:start">
              <xsl:for-each select="legend/v">
                <text x="{$legend_label_x}" y="{$legend_label_y+$legend_step_y*(position()-1)}" >
                  <xsl:value-of select="text()"/>
                </text>
              </xsl:for-each>
            </g>
          </g>
        </xsl:if>

        <xsl:comment>draw graph background</xsl:comment>
        <xsl:if test="$background_visible">
          <xsl:call-template name="graph_background">
            <xsl:with-param name="x" select="$graph_left_margin" />
            <xsl:with-param name="y" select="$graph_top_margin" />
            <xsl:with-param name="width" select="$viewbox_width - $graph_right_margin - $graph_left_margin" />
            <xsl:with-param name="height" select="$viewbox_height - $graph_bottom_margin - $graph_top_margin"/>
            <xsl:with-param name="y0" select="$y0"/>
            <xsl:with-param name="top_fill" select="$background_color1"/>
            <xsl:with-param name="bottom_fill" select="$background_color1"/>
          </xsl:call-template>
        </xsl:if>


        <xsl:comment>draw Y grid lines</xsl:comment>

        <xsl:for-each select="settings/y_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_y_grid" stroke="{$y_grid_color}" stroke-width="{$y_grid_width}">
              <xsl:variable name="NbLines" select="count(../../y_grid_values/s)"/>
              <xsl:for-each select="../../y_grid_values/s">
                <xsl:choose>
                  <xsl:when test="(position() != 1) and (position() != $NbLines)">
                    <xsl:variable name="y_line_pos" select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale)" />
                    <line x1="{$graph_left_margin}" y1="{$y_line_pos}" x2="{$viewbox_width - $graph_right_margin}" y2="{$y_line_pos}" />
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

		<xsl:comment>draw Y grid lines SHADOWS</xsl:comment>

        <xsl:for-each select="settings/y_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_y_grid_shadow" stroke="{$y_grid_color_shadow}" stroke-width="{$y_grid_width}">
              <xsl:variable name="NbLines" select="count(../../y_grid_values/s)"/>
              <xsl:for-each select="../../y_grid_values/s">
                <xsl:choose>
                  <xsl:when test="(position() != 1) and (position() != $NbLines)">
                    <xsl:variable name="y_line_pos" select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale)" />
                    <line x1="{$graph_left_margin}" y1="{$y_line_pos - 1}" x2="{$viewbox_width - $graph_right_margin}" y2="{$y_line_pos - 1}"/>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>


        <xsl:comment>draw X grid lines</xsl:comment>

        <xsl:for-each select="settings/x_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_x_grid" stroke="{$x_grid_color}" stroke-width="{$x_grid_width}">
              <xsl:variable name="NbLines" select="count(../../x_values/v)"/>
              <xsl:for-each select="../../x_values/v">
                <xsl:choose>
                  <xsl:when test="(position() != 0) and (position() != $NbLines)">
                    <xsl:variable name="x_line_pos" select="$graph_left_margin+($data_group_width*position())" />
                    <line x1="{$x_line_pos}" y1="{$graph_top_margin}" x2="{$x_line_pos}" y2="{$viewbox_height - $graph_bottom_margin}" />
                   </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

        <xsl:comment>draw X grid lines SHADOWS </xsl:comment>

        <xsl:for-each select="settings/x_grid">
          <xsl:if test="text() = 'true'" >
            <g id="ID_x_grid_shadow" stroke="{$x_grid_color_shadow}" stroke-width="{$x_grid_width}">
              <xsl:variable name="NbLines" select="count(../../x_values/v)"/>
              <xsl:for-each select="../../x_values/v">
                <xsl:choose>
                  <xsl:when test="(position() != 0) and (position() != $NbLines)">
                    <xsl:variable name="x_line_pos" select="$graph_left_margin+($data_group_width*position())" />
                    <line x1="{$x_line_pos+1}" y1="{$graph_top_margin}" x2="{$x_line_pos+1}" y2="{$viewbox_height - $graph_bottom_margin}"/>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </g>
          </xsl:if>
        </xsl:for-each>

        <xsl:comment>draw y=0 axe</xsl:comment>
        <xsl:if test="$y_min &lt; 0">
          <g id="ID_y0_axis" stroke="{$axis_y0_color}" stroke-width="{$axis_width}" visibility = "{$axis_visibility}">
            <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$y0}" y2="{$y0}"/>
          </g>
        </xsl:if>


        <xsl:comment>draw axis x labels</xsl:comment>
        <g id="ID_x_values" visibility = "{$x_label_visibility}" style="fill:{$x_label_color};stroke:none;font-family:{$x_label_font_family};font-size:{$x_label_font_size}px;font-weight:{$x_label_font_weight};font-style:{$x_label_font_style};text-decoration:{$x_label_font_decoration};filter:{$x_label_font_filter}">
          <xsl:for-each select="x_values/v">
            <xsl:variable name="pos"
              select="$graph_left_margin+($data_group_width*(position()-1))+($data_group_width div 2)"/>

            <!-- create label text element -->
            <xsl:call-template name="label_align_middle">
              <xsl:with-param name="x"                      select="$pos" />
              <xsl:with-param name="y"                      select="$viewbox_height - $base_margin" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(text(),$x_label_format_number,$x_label_format_date,$x_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$x_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$x_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$x_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$x_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$x_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$x_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$x_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$x_label_border_stroke_width" />
            </xsl:call-template>
          </xsl:for-each>
        </g>

        <xsl:comment>draw axis y labels</xsl:comment>
        <g id="ID_y_values" visibility = "{$y_label_visibility}" style="fill:{$y_label_color};stroke:none;font-family:{$y_label_font_family};font-size:{$y_label_font_size}px;font-weight:{$y_label_font_weight};font-style:{$y_label_font_style};text-decoration:{$y_label_font_decoration};filter:{$y_label_font_filter}">
          <xsl:for-each select="y_grid_values/s">
            <xsl:variable name="pos" select="position()" />
            <xsl:call-template name="label_align_right">
              <xsl:with-param name="x"                      select="$base_margin+$y_label_width" />
              <xsl:with-param name="y"                      select="$viewbox_height - $graph_bottom_margin - ((number(text()) - $y_min)*$y_scale) + ($font_size div 2)" />
              <xsl:with-param name="text"                   select="exsl4D:format-value(string(../v[$pos]),$y_label_format_number,$y_label_format_date,$y_label_format_time)"/>

              <xsl:with-param name="font_size"              select="$y_label_font_size"/>
              <xsl:with-param name="font_descent"           select="$y_label_font_descent"/>

              <xsl:with-param name="border_visible"         select="$y_label_border_visible" />
              <xsl:with-param name="border_margin"          select="$y_label_border_margin" />
              <xsl:with-param name="border_fill_color"      select="$y_label_border_fill_color" />
              <xsl:with-param name="border_fill_opacity"    select="$y_label_border_fill_opacity" />
              <xsl:with-param name="border_stroke_color"    select="$y_label_border_stroke_color" />
              <xsl:with-param name="border_stroke_width"    select="$y_label_border_stroke_width" />
            </xsl:call-template>
          </xsl:for-each>
        </g>



        <xsl:comment>draw bars SHADOWS</xsl:comment>

        <g id = "allGroups" clip-path="url(#ID_BackgroundClipPath)" shape-rendering="auto">
          <!-- iterate on data types -->

          <xsl:for-each select="y_values">
            <xsl:comment>
              draw bars shadows for data type <xsl:value-of select="string(position())"></xsl:value-of>
            </xsl:comment>

            <!-- local variables-->
            <xsl:variable name="y_values_index" select="position()"/>

            <!-- iterate on y numbers -->
            <g id="ID_graph_shadow_{position()}" fill="{$bar_shadow_color}" fill-opacity = "{$bar_shadow_opacity}">
              <xsl:for-each select="s">
                <!-- the bar's x position -->
                <xsl:variable name="xpos" select="position()" />
                <xsl:variable name="pos"
                              select="$graph_left_margin+($data_group_width*($xpos - 1))+$bar_group_offset"/>

                <xsl:variable name="ymin"  select="$y0 - ($y_max*$y_scale)" />
                <xsl:variable name="ymax"  select="$y0 - ($y_min*$y_scale)" />

                <xsl:variable name="bar_height_total" select="(math:abs(exsl4D:sum-neg(//y_values/s[$xpos]))+exsl4D:sum-pos(//y_values/s[$xpos]))*$y_scale" />
                <xsl:variable name="bar_height_neg" select="math:abs(exsl4D:sum-neg(//y_values/s[$xpos]))*$y_scale" />
                <xsl:variable name="bar_height_pos" select="exsl4D:sum-pos(//y_values/s[$xpos])*$y_scale" />

                <!-- the rectangle -->
                <xsl:choose>
                  <xsl:when test="number(text()) &gt; 0">
                    <!-- draw positive bars -->

                    <xsl:variable name="bar_height_prev" select="exsl4D:sum-pos(//y_values[position() &lt; ($y_values_index)]/s[$xpos])*$y_scale" />
                    <xsl:variable name="bar_height" select="exsl4D:sum-pos(//y_values[position() &lt; ($y_values_index+1)]/s[$xpos])*$y_scale" />

                    <xsl:choose>
                      <xsl:when test="($bar_height_prev+$bar_height_neg) &gt; 0">
                        <!-- draw not bottom part -->
                        <xsl:choose>
                          <xsl:when test="($bar_height+$bar_height_neg+0.01) &lt; $bar_height_total">
                            <!-- draw middle part -->
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <!-- draw top part -->
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_top_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <!-- draw bottom positive part -->
                        <xsl:choose>
                          <xsl:when test="$bar_height &lt; $bar_height_pos">
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_top_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>

                  </xsl:when>
                  <xsl:otherwise>
                    <!-- draw negative bars -->

                    <xsl:variable name="bar_height_prev" select="(math:abs(exsl4D:sum-neg(//y_values[position() &lt; ($y_values_index)]/s[$xpos]))+$bar_height_pos)*$y_scale" />
                    <xsl:variable name="bar_height" select="math:abs(exsl4D:sum-neg(//y_values[position() &lt; ($y_values_index+1)]/s[$xpos]))*$y_scale" />

                    <xsl:choose>
                      <xsl:when test="$bar_height_prev &gt; 0">
                        <!-- draw not top part -->
                        <xsl:choose>
                          <xsl:when test="($bar_height+$bar_height_pos+0.01) &lt; $bar_height_total">
                            <!-- draw middle part -->
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <!-- draw bottom part -->
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_btm_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <!-- draw top negative part -->
                        <xsl:choose>
                          <xsl:when test="$bar_height &lt; $bar_height_neg">
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_btm_shadow">
                                <xsl:with-param name="x" select="$pos+$bar_shadow_shift_x" />
                                <xsl:with-param name="y" select="$ytop+$bar_shadow_shift_y" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:for-each>
            </g>
          </xsl:for-each>
        </g>







        <xsl:comment>draw bars</xsl:comment>
        <g id = "allGroups" filter="{$bar_filter}" shape-rendering="auto">
          <!-- iterate on data types -->
          <xsl:for-each select="y_values">
            <xsl:comment>
              draw bars for data type <xsl:value-of select="string(position())"></xsl:value-of>
            </xsl:comment>

            <!-- local variables-->
            <xsl:variable name="y_values_index" select="position()"/>

            <!-- get data type color -->
            <xsl:variable name="fill_color">
              <xsl:choose>
                <xsl:when test="$y_values_index = 1">
                  <xsl:value-of select="$default_color1"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 2">
                  <xsl:value-of select="$default_color2"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 3">
                  <xsl:value-of select="$default_color3"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 4">
                  <xsl:value-of select="$default_color4"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 5">
                  <xsl:value-of select="$default_color5"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 6">
                  <xsl:value-of select="$default_color6"/>
                </xsl:when>
                <xsl:when test="$y_values_index = 7">
                  <xsl:value-of select="$default_color7"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$default_color8"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <!-- iterate on y numbers -->
            <g id="ID_graph_{$y_values_index}" fill="{$fill_color}" fill-opacity = "{$bar_fill_opacity}" stroke="{$bar_stroke}" stroke-opacity = "{$bar_stroke_opacity}" stroke-width = "{$bar_stroke_width}" >
              <xsl:for-each select="s">
                <!-- the bar's x position -->
                <xsl:variable name="xpos" select="position()" />
                <xsl:variable name="pos"
                              select="$graph_left_margin+($data_group_width*($xpos - 1))+$bar_group_offset"/>

                <xsl:variable name="ymin"  select="$y0 - ($y_max*$y_scale)" />
                <xsl:variable name="ymax"  select="$y0 - ($y_min*$y_scale)" />

                <xsl:variable name="bar_height_total" select="(math:abs(exsl4D:sum-neg(//y_values/s[$xpos]))+exsl4D:sum-pos(//y_values/s[$xpos]))*$y_scale" />
                <xsl:variable name="bar_height_neg" select="math:abs(exsl4D:sum-neg(//y_values/s[$xpos]))*$y_scale" />
                <xsl:variable name="bar_height_pos" select="exsl4D:sum-pos(//y_values/s[$xpos])*$y_scale" />

                <!-- the rectangle -->

                <xsl:choose>
                  <xsl:when test="number(text()) &gt; 0">
                    <!-- draw positive bars -->

                    <xsl:variable name="bar_height_prev" select="exsl4D:sum-pos(//y_values[position() &lt; ($y_values_index)]/s[$xpos])*$y_scale" />
                    <xsl:variable name="bar_height" select="exsl4D:sum-pos(//y_values[position() &lt; ($y_values_index+1)]/s[$xpos])*$y_scale" />

                    <xsl:choose>
                      <xsl:when test="($bar_height_prev+$bar_height_neg) &gt; 0">
                        <!-- draw not bottom part -->
                        <xsl:choose>
                          <xsl:when test="($bar_height+$bar_height_neg+0.01) &lt; $bar_height_total">
                            <!-- draw middle part -->
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <!-- draw top part -->
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_top">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <!-- draw bottom positive part -->
                        <xsl:choose>
                          <xsl:when test="$bar_height &lt; $bar_height_pos">
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:variable name="yt"        select="$y0 - $bar_height" />
                            <xsl:variable name="yb"        select="$yt + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_top">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>
                    </xsl:choose>

                  </xsl:when>
                  <xsl:otherwise>
                    <!-- draw negative bars -->

                    <xsl:variable name="bar_height_prev" select="(math:abs(exsl4D:sum-neg(//y_values[position() &lt; ($y_values_index)]/s[$xpos]))+$bar_height_pos)*$y_scale" />
                    <xsl:variable name="bar_height" select="math:abs(exsl4D:sum-neg(//y_values[position() &lt; ($y_values_index+1)]/s[$xpos]))*$y_scale" />

                    <xsl:choose>
                      <xsl:when test="$bar_height_prev &gt; 0">
                        <!-- draw not top part -->
                        <xsl:choose>
                          <xsl:when test="($bar_height+$bar_height_pos+0.01) &lt; $bar_height_total">
                            <!-- draw middle part -->
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <!-- draw bottom part -->
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_btm">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>
                        <!-- draw top negative part -->
                        <xsl:choose>
                          <xsl:when test="$bar_height &lt; $bar_height_neg">
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:variable name="yb"        select="$y0 + $bar_height" />
                            <xsl:variable name="yt"        select="$yb + (number(text())*$y_scale)" />
                            <xsl:variable name="ytop"      select="exsl4D:max(exsl4D:min($yt, $ymax), $ymin)" />
                            <xsl:variable name="ybottom"   select="exsl4D:max(exsl4D:min($yb, $ymax), $ymin)" />
                            <xsl:variable name="bheight"    select="$ybottom - $ytop" />
                            <xsl:if test="$bheight &gt; 0" >
                              <xsl:call-template name="bar_r_btm">
                                <xsl:with-param name="x" select="$pos" />
                                <xsl:with-param name="y" select="$ytop" />
                                <xsl:with-param name="width" select="$bar_width" />
                                <xsl:with-param name="height" select="$bheight" />
                                <xsl:with-param name="r" select="exsl4D:min($bheight,$bar_r)"/>
                              </xsl:call-template>
                            </xsl:if>
                          </xsl:otherwise>
                        </xsl:choose>
                      </xsl:otherwise>

                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>

              </xsl:for-each>
            </g>
          </xsl:for-each>
        </g>


<!--
        <xsl:comment>draw the axes</xsl:comment>
        <xsl:comment>draw horizontal axes</xsl:comment>
        <g id="ID_x_axis" stroke="{$axis_color}" stroke-width="{$axis_width}" visibility = "{$axis_visibility}">
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$graph_top_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$graph_left_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$viewbox_height - $graph_bottom_margin}"/>
        </g>
        <xsl:comment>draw vertical axes</xsl:comment>
        <g id="ID_y_axis" stroke="{$axis_color}" stroke-width="{$axis_width}" visibility = "{$axis_visibility}">
          <line x1="{$graph_left_margin}" x2="{$graph_left_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
          <line x1="{$viewbox_width - $graph_right_margin}" x2="{$viewbox_width - $graph_right_margin}" y1="{$viewbox_height - $graph_bottom_margin}" y2="{$graph_top_margin}"/>
        </g>
-->

      </g>
    </svg>
  </xsl:template>
</xsl:stylesheet>
